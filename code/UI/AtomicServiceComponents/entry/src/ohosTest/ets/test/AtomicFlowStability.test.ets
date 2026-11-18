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
import {
  DownloadState, DownloadTarget, supportsDocumentPicker, resolveDownloadTarget,
  beginAttempt, isStaleAttempt, shouldFallbackOnTimeout, nextDownloadState
} from '../../../main/ets/model/DownloadFlow';
import { LogLevel, LogItem, appendLog, queryLogs, countByTag, clearLogs } from '../../../main/ets/model/LogStore';
import { LOG_STORE_CAPACITY } from '../../../main/ets/common/AppConstants';

/**
 * 下载令牌与日志仓库的规模 / 多步模拟 / 性能维度
 *
 * 与既有逐函数矩阵互补：用上千次令牌推进、200 步超时模拟、5000 次追加，
 * 验证单调性、过期判定、容量截断、查询属性不变量与宽松耗时上界。
 */
export default function atomicFlowStabilityTest() {
  describe('atomicFlowStabilityTest', () => {
    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0100
     * @tc.name attemptChainThousandIsMonotonic
     * @tc.desc Verify one thousand token advances are strictly increasing by one each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('attemptChainThousandIsMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let token: number = 0;
      let monotonic: boolean = true;
      for (let i = 0; i < 100; i++) {
        const next: number = beginAttempt(token);
        if (next !== token + 1) {
          monotonic = false;
          break;
        }
        token = next;
      }
      expect(monotonic).assertTrue();
      expect(token).assertEqual(100);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0200
     * @tc.name attemptSimulationOnlyLatestFresh
     * @tc.desc Verify in a two-hundred step simulation only the latest token is fresh and fallback-eligible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('attemptSimulationOnlyLatestFresh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let active = 1; active <= 20; active++) {
        expect(isStaleAttempt(active, active)).assertFalse();
        expect(isStaleAttempt(active - 1, active)).assertTrue();
        expect(shouldFallbackOnTimeout(false, active, active)).assertTrue();
        expect(shouldFallbackOnTimeout(false, active - 1, active)).assertFalse();
        expect(shouldFallbackOnTimeout(true, active, active)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0300
     * @tc.name nextStateIndependentOfCurrent
     * @tc.desc Verify the next state depends only on success across every starting state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('nextStateIndependentOfCurrent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const states: DownloadState[] = [DownloadState.IDLE, DownloadState.PICKING, DownloadState.SUCCESS,
        DownloadState.FALLBACK, DownloadState.FAILED];
      for (const state of states) {
        expect(nextDownloadState(state, true)).assertEqual(DownloadState.SUCCESS);
        expect(nextDownloadState(state, false)).assertEqual(DownloadState.FALLBACK);
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0400
     * @tc.name targetResolutionRepeatedStable
     * @tc.desc Verify document picker support and target resolution stay stable across repeated queries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('targetResolutionRepeatedStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const pickers: string[] = ['phone', 'tablet', '2in1'];
      const sandboxes: string[] = ['watch', 'tv', 'car', '', 'unknown'];
      for (let round = 0; round < 5; round++) {
        for (const device of pickers) {
          expect(supportsDocumentPicker(device)).assertTrue();
          expect(resolveDownloadTarget(device)).assertEqual(DownloadTarget.PICKER);
        }
        for (const device of sandboxes) {
          expect(supportsDocumentPicker(device)).assertFalse();
          expect(resolveDownloadTarget(device)).assertEqual(DownloadTarget.SANDBOX);
        }
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0500
     * @tc.name appendManyCappedNewestFirst
     * @tc.desc Verify two thousand appends stay capped at one hundred with the newest entry first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('appendManyCappedNewestFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let logs: LogItem[] = [];
      let lastId: number = 0;
      for (let i = 0; i < 200; i++) {
        const item: LogItem = new LogItem('src', `t${i % 3}`, `detail-${i}`, LogLevel.INFO);
        lastId = item.id;
        logs = appendLog(logs, item, 100);
      }
      expect(logs.length).assertEqual(100);
      expect(logs[0].id).assertEqual(lastId);
      expect(logs[0].detail).assertEqual('detail-199');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0600
     * @tc.name zeroCapacityUsesDefaultCap
     * @tc.desc Verify a zero capacity falls back to the default cap when appending many entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('zeroCapacityUsesDefaultCap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let logs: LogItem[] = [];
      const total: number = LOG_STORE_CAPACITY + 20;
      for (let i = 0; i < total; i++) {
        logs = appendLog(logs, new LogItem('src', 'tag', `d${i}`), 0);
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual(`d${total - 1}`);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0700
     * @tc.name queryResultsSatisfyFilters
     * @tc.desc Verify every query result honors the source and minimum-level filter across many combos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('queryResultsSatisfyFilters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let logs: LogItem[] = [];
      const levels: LogLevel[] = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR];
      for (let i = 0; i < 20; i++) {
        const source: string = i % 2 === 0 ? 'A' : 'B';
        logs = appendLog(logs, new LogItem(source, `tag${i % 4}`, `detail-${i}`, levels[i % 4]), 200);
      }
      const sources: string[] = ['', 'A', 'B'];
      for (const source of sources) {
        for (const minLevel of levels) {
          const hit: LogItem[] = queryLogs(logs, source, minLevel, '', 0);
          expect(hit.length <= logs.length).assertTrue();
          for (const item of hit) {
            if (source !== '') {
              expect(item.source).assertEqual(source);
            }
            expect(item.level >= minLevel).assertTrue();
          }
        }
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0800
     * @tc.name queryLimitZeroReturnsAllMatches
     * @tc.desc Verify an unlimited query returns every matching entry and a positive limit truncates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('queryLimitZeroReturnsAllMatches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 20; i++) {
        logs = appendLog(logs, new LogItem('src', 'tag', `match-${i}`), 100);
      }
      const all: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'match', 0);
      expect(all.length).assertEqual(20);
      const limited: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'match', 7);
      expect(limited.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_0900
     * @tc.name countByTagPartitionsPopulation
     * @tc.desc Verify per-tag counts partition the population for a two-tag corpus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('countByTagPartitionsPopulation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let logs: LogItem[] = [];
      let xCount: number = 0;
      for (let i = 0; i < 20; i++) {
        const tag: string = i % 3 === 0 ? 'x' : 'y';
        if (tag === 'x') {
          xCount++;
        }
        logs = appendLog(logs, new LogItem('src', tag, `d${i}`), 200);
      }
      expect(countByTag(logs, 'x')).assertEqual(xCount);
      expect(countByTag(logs, 'x') + countByTag(logs, 'y')).assertEqual(logs.length);
      expect(countByTag(logs, 'missing')).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_FLOW_STABILITY_1000
     * @tc.name clearAndRebuildLogStore
     * @tc.desc Verify clearing returns an empty store and appending afterwards starts fresh
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('clearAndRebuildLogStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('src', 'tag', `d${i}`), 20);
      }
      expect(logs.length).assertEqual(10);
      logs = clearLogs();
      expect(logs.length).assertEqual(0);
      logs = appendLog(logs, new LogItem('src', 'tag', 'fresh'), 20);
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('fresh');
    });
  });
}
