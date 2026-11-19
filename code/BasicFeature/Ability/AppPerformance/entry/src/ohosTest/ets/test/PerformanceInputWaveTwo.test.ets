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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import { AppService } from '../../../main/ets/core/AppService';
import { FakePlatform, MemoryStore, fixtureError } from '../support/FakePlatform';
import { RejectionPlatform } from '../support/CoveragePlatform';

export default function performanceInputWaveTwoTests(): void {
  describe('PerformanceInputWaveTwo', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_INPUTWAVETWO_0100
     * @tc.name testPerformanceInputWaveTwo0001
     * @tc.desc 真实存档混入非对象日志和启动项时只过滤坏元素，合法项与调用编号继续恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceInputWaveTwo0001', 0, async (): Promise<void> => {
      const store = new MemoryStore();
      const original = AppService.fromPlatform(new FakePlatform(store));
      original.setSnapEnabled(true); original.markContentLoaded();
      await original.whenSaved();
      const savedCall = original.getState().logs[0];
      const savedLaunch = original.getState().launches[0];
      original.dispose();
      const raw = JSON.parse(store.value) as Record<string, Object>;
      raw['logs'] = [JSON.parse('null') as Object, savedCall, 7, 'bad-log'];
      raw['launches'] = [false, savedLaunch, JSON.parse('null') as Object, 'bad-launch'];
      store.value = JSON.stringify(raw);
      const reopened = AppService.fromPlatform(new FakePlatform(store));
      try {
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:45 assertEqual actual', reopened.getState().logs.map((record): number => record.id).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:45 assertEqual expected', `${savedCall.id}`));
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:46 assertEqual actual', reopened.getState().launches.map((sample): string => sample.id).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:46 assertEqual expected', savedLaunch.id));
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:47 assertEqual actual', reopened.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:47 assertEqual expected', ''));
        reopened.setSnapEnabled(false);
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:49 assertEqual actual', reopened.getState().logs[0].id)).assertEqual(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0001 PerformanceInputWaveTwo.test:49 assertEqual expected', savedCall.id + 1));
        await reopened.whenSaved();
      } finally { reopened.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_INPUTWAVETWO_0200
     * @tc.name testPerformanceInputWaveTwo0002
     * @tc.desc SDK错误对象的空消息使用失败兜底，有限零错误码仍原样保存且释放忙状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceInputWaveTwo0002', 0, async (): Promise<void> => {
      const platform = new RejectionPlatform(); platform.failure = fixtureError(0, '');
      const service = AppService.fromPlatform(platform);
      try {
        const result = await service.evictFiles(['entry.hap']);
        const memory = service.getState().latestMemory;
        if (memory === undefined) { throw new Error('Missing real eviction result'); }
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0002 PerformanceInputWaveTwo.test:69 assertEqual actual', result.status)).assertEqual(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0002 PerformanceInputWaveTwo.test:69 assertEqual expected', 'rejected'));
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0002 PerformanceInputWaveTwo.test:70 assertEqual actual', result.code)).assertEqual(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0002 PerformanceInputWaveTwo.test:70 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0002 PerformanceInputWaveTwo.test:71 assertEqual actual', memory.message)).assertEqual(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0002 PerformanceInputWaveTwo.test:71 assertEqual expected', '调用失败'));
        expect(traceParameter('com.samples.appperformance_PerformanceInputWaveTwo_0002 PerformanceInputWaveTwo.test:72 assertFalse actual', service.isExperimentBusy())).assertFalse();
      } finally { service.dispose(); }
    });
  });
}
