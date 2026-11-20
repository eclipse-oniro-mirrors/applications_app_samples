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
import { AppService } from '../../../main/ets/core/AppService';
import { MaintenanceFlow, MaintenanceStep } from '../../../main/ets/core/Types';
import { scenario } from '../support/BoundedCase';
import { FakePlatform, fixtureError } from '../support/FakePlatform';

class MismatchConfigPlatform extends FakePlatform {
  private reads: number = 0;

  readConfig(): string {
    this.reads++;
    if (this.reads <= 1) {
      return super.readConfig();
    }
    return '{"evictFilePages":["entry.hap"]}';
  }
}

class MismatchResourcePlatform extends FakePlatform {
  private reads: number = 0;

  readResource(): Promise<Uint8Array> {
    this.reads++;
    const bytes: Uint8Array = this.reads <= 1 ? new Uint8Array([1, 2, 3]) : new Uint8Array([1, 2, 4]);
    return Promise.resolve(bytes);
  }
}

function status(flow: MaintenanceFlow, index: number): string {
  return flow.steps[index].status;
}

export default function maintenanceFlowTests(): void {
  describe('MaintenanceFlow', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0100
     * @tc.name      testMaintenanceFlow0001
     * @tc.desc      Verify full flow discovers config warms evicts and rereads
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0001', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:65 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0001 ' +
            'MaintenanceFlow.test:69 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0001 ' +
              'MaintenanceFlow.test:69 assertEqual expected',
            'completed'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:70 assertEqual actual', flow.steps.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:70 assertEqual expected', 6));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0001 ' +
            'MaintenanceFlow.test:71 assertTrue actual',
          flow.steps.every((step: MaintenanceStep): boolean => step.status === 'success'))).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:72 assertTrue actual', flow.steps[0].detail.indexOf('3 个文件') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:73 assertTrue actual', flow.steps[1].detail.indexOf('配置有效') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:74 assertTrue actual', flow.steps[2].detail.indexOf('FNV') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:75 assertTrue actual', flow.steps[3].detail.indexOf('调用成功') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:76 assertTrue actual', flow.steps[4].detail.indexOf('业务资源校验一致') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:77 assertTrue actual', flow.steps[5].detail.indexOf('不代表驻留页已下降') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:78 assertTrue actual', flow.notice.indexOf('业务资源长度与校验值已比对') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:79 assertTrue actual', flow.notice.indexOf('仍需独立观测') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:80 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:80 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:81 assertEqual actual', platform.fileCalls[0].join('|'))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:81 assertEqual expected', 'libentry.so|entry.hap|shared.hsp'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:82 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:82 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:83 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:83 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:84 assertFalse actual', service.getState().maintenanceBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:85 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0001 MaintenanceFlow.test:85 assertEqual expected', 0));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0200
     * @tc.name      testMaintenanceFlow0002
     * @tc.desc      Verify invalid config stops before workload and eviction
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0002', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.config = '{"evictFilePages":[]}';
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0002 MaintenanceFlow.test:107 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0002 ' +
            'MaintenanceFlow.test:111 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0002 ' +
              'MaintenanceFlow.test:111 assertEqual expected',
            'invalid_config'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0002 ' +
            'MaintenanceFlow.test:112 assertEqual actual',
          status(flow, 0)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0002 ' +
              'MaintenanceFlow.test:112 assertEqual expected',
            'success'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0002 ' +
            'MaintenanceFlow.test:113 assertEqual actual',
          status(flow, 1)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0002 ' +
              'MaintenanceFlow.test:113 assertEqual expected',
            'failed'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0002 ' +
            'MaintenanceFlow.test:114 assertEqual actual',
          status(flow, 2)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0002 ' +
              'MaintenanceFlow.test:114 assertEqual expected',
            'skipped'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0002 ' +
            'MaintenanceFlow.test:115 assertEqual actual',
          status(flow, 3)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0002 ' +
              'MaintenanceFlow.test:115 assertEqual expected',
            'skipped'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0002 ' +
            'MaintenanceFlow.test:116 assertEqual actual',
          status(flow, 4)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0002 ' +
              'MaintenanceFlow.test:116 assertEqual expected',
            'skipped'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0002 ' +
            'MaintenanceFlow.test:117 assertEqual actual',
          status(flow, 5)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0002 ' +
              'MaintenanceFlow.test:117 assertEqual expected',
            'skipped'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0002 MaintenanceFlow.test:118 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0002 MaintenanceFlow.test:118 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0002 MaintenanceFlow.test:119 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0002 MaintenanceFlow.test:119 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0002 MaintenanceFlow.test:120 assertFalse actual', service.getState().maintenanceBusy)).assertFalse();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0300
     * @tc.name      testMaintenanceFlow0003
     * @tc.desc      Verify missing targets stop the flow at discovery
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0003', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.files = [];
      platform.modules = [];
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0003 MaintenanceFlow.test:143 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0003 ' +
            'MaintenanceFlow.test:147 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0003 ' +
              'MaintenanceFlow.test:147 assertEqual expected',
            'no_targets'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0003 ' +
            'MaintenanceFlow.test:148 assertEqual actual',
          status(flow, 0)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0003 ' +
              'MaintenanceFlow.test:148 assertEqual expected',
            'failed'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0003 ' +
            'MaintenanceFlow.test:149 assertEqual actual',
          status(flow, 1)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0003 ' +
              'MaintenanceFlow.test:149 assertEqual expected',
            'skipped'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0003 MaintenanceFlow.test:150 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0003 MaintenanceFlow.test:150 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0003 MaintenanceFlow.test:151 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0003 MaintenanceFlow.test:151 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0003 MaintenanceFlow.test:152 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0003 MaintenanceFlow.test:152 assertEqual expected', 0));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0400
     * @tc.name      testMaintenanceFlow0004
     * @tc.desc      Verify workload failure stops before eviction and releases busy flag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0004', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.resourceErrorCode = 16000050;
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0004 MaintenanceFlow.test:174 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0004 ' +
            'MaintenanceFlow.test:178 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0004 ' +
              'MaintenanceFlow.test:178 assertEqual expected',
            'workload_failed'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0004 ' +
            'MaintenanceFlow.test:179 assertEqual actual',
          status(flow, 2)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0004 ' +
              'MaintenanceFlow.test:179 assertEqual expected',
            'failed'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0004 ' +
            'MaintenanceFlow.test:180 assertEqual actual',
          status(flow, 3)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0004 ' +
              'MaintenanceFlow.test:180 assertEqual expected',
            'skipped'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0004 ' +
            'MaintenanceFlow.test:181 assertEqual actual',
          status(flow, 4)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0004 ' +
              'MaintenanceFlow.test:181 assertEqual expected',
            'skipped'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0004 ' +
            'MaintenanceFlow.test:182 assertEqual actual',
          status(flow, 5)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0004 ' +
              'MaintenanceFlow.test:182 assertEqual expected',
            'skipped'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0004 MaintenanceFlow.test:183 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0004 MaintenanceFlow.test:183 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0004 MaintenanceFlow.test:184 assertFalse actual', service.getState().maintenanceBusy)).assertFalse();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0500
     * @tc.name      testMaintenanceFlow0005
     * @tc.desc      Verify eviction rejection keeps the failed stage and clears timer
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0005', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.fileErrorCode = 16000050;
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0005 MaintenanceFlow.test:206 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0005 ' +
            'MaintenanceFlow.test:210 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0005 ' +
              'MaintenanceFlow.test:210 assertEqual expected',
            'eviction_failed'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0005 ' +
            'MaintenanceFlow.test:211 assertEqual actual',
          status(flow, 3)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0005 ' +
              'MaintenanceFlow.test:211 assertEqual expected',
            'failed'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0005 ' +
            'MaintenanceFlow.test:212 assertEqual actual',
          status(flow, 4)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0005 ' +
              'MaintenanceFlow.test:212 assertEqual expected',
            'skipped'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0005 ' +
            'MaintenanceFlow.test:213 assertEqual actual',
          status(flow, 5)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0005 ' +
              'MaintenanceFlow.test:213 assertEqual expected',
            'skipped'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0005 MaintenanceFlow.test:214 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0005 MaintenanceFlow.test:214 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0005 MaintenanceFlow.test:215 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0005 MaintenanceFlow.test:215 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0005 MaintenanceFlow.test:216 assertFalse actual', service.getState().memoryBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0005 MaintenanceFlow.test:217 assertFalse actual', service.getState().maintenanceBusy)).assertFalse();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0600
     * @tc.name      testMaintenanceFlow0006
     * @tc.desc      Verify config reread mismatch completes with visible failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0006', async (): Promise<void> => {
      const platform = new MismatchConfigPlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0006 MaintenanceFlow.test:238 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0006 ' +
            'MaintenanceFlow.test:242 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0006 ' +
              'MaintenanceFlow.test:242 assertEqual expected',
            'completed_with_failures'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0006 ' +
            'MaintenanceFlow.test:243 assertEqual actual',
          status(flow, 3)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0006 ' +
              'MaintenanceFlow.test:243 assertEqual expected',
            'success'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0006 ' +
            'MaintenanceFlow.test:244 assertEqual actual',
          status(flow, 4)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0006 ' +
              'MaintenanceFlow.test:244 assertEqual expected',
            'success'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0006 ' +
            'MaintenanceFlow.test:245 assertEqual actual',
          status(flow, 5)))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0006 ' +
              'MaintenanceFlow.test:245 assertEqual expected',
            'failed'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0006 MaintenanceFlow.test:246 assertEqual actual', flow.steps[5].detail)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0006 MaintenanceFlow.test:246 assertEqual expected', '配置回读与首次不一致'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0006 MaintenanceFlow.test:247 assertTrue actual', flow.notice.indexOf('不得判定为零回收') >= 0)).assertTrue();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0700
     * @tc.name      testMaintenanceFlow0007
     * @tc.desc      Verify second invocation is rejected while one flow is running
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0007', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        const first: Promise<void> = service.runMaintenanceFlow();
        await service.runMaintenanceFlow();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0007 MaintenanceFlow.test:268 assertTrue actual', service.getState().maintenanceBusy)).assertTrue();
        await first;
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0007 MaintenanceFlow.test:271 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0007 MaintenanceFlow.test:275 assertEqual actual', flow.id)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0007 MaintenanceFlow.test:275 assertEqual expected', 1));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0007 ' +
            'MaintenanceFlow.test:276 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0007 ' +
              'MaintenanceFlow.test:276 assertEqual expected',
            'completed'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0007 MaintenanceFlow.test:277 assertFalse actual', service.getState().maintenanceBusy)).assertFalse();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0800
     * @tc.name      testMaintenanceFlow0008
     * @tc.desc      Verify discover failure through thrown listing is reported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0008', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.listErrorCode = 16000050;
      platform.modules = [];
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0008 MaintenanceFlow.test:300 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0008 ' +
            'MaintenanceFlow.test:304 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0008 ' +
              'MaintenanceFlow.test:304 assertEqual expected',
            'no_targets'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0008 MaintenanceFlow.test:305 assertTrue actual', flow.steps[0].detail.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0008 MaintenanceFlow.test:306 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0008 MaintenanceFlow.test:306 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0008 MaintenanceFlow.test:307 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0008 MaintenanceFlow.test:307 assertEqual expected', 0));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_0900
     * @tc.name      testMaintenanceFlow0009
     * @tc.desc      Verify disposal during flow leaves no timer or busy state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0009', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.deferFile = true;
      const service = AppService.fromPlatform(platform);
      try {
        const running: Promise<void> = service.runMaintenanceFlow();
        service.dispose();
        platform.releaseFile();
        await running;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0009 MaintenanceFlow.test:331 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0009 MaintenanceFlow.test:331 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0009 MaintenanceFlow.test:332 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0009 MaintenanceFlow.test:332 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0009 MaintenanceFlow.test:333 assertFalse actual', service.getState().maintenanceBusy)).assertFalse();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_1000
     * @tc.name      testMaintenanceFlow0010
     * @tc.desc      Verify failure uses fixture error code in stage detail
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0010', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.resourceErrorCode = 12345;
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow();
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0010 MaintenanceFlow.test:355 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0010 MaintenanceFlow.test:359 assertTrue actual', flow.steps[2].detail.indexOf('12345') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0010 MaintenanceFlow.test:360 assertEqual actual', fixtureError(9, 'x').code)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0010 MaintenanceFlow.test:360 assertEqual expected', 9));
      } finally {
        service.dispose();
      }
    });
    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_1100
     * @tc.name      testMaintenanceFlow0011
     * @tc.desc      Verify control group performs no eviction and still validates workload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0011', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow('control');
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:380 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:384 assertEqual actual', flow.mode)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:384 assertEqual expected', 'control'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0011 ' +
            'MaintenanceFlow.test:385 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0011 ' +
              'MaintenanceFlow.test:385 assertEqual expected',
            'completed'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:386 assertTrue actual', flow.steps[3].detail.indexOf('对照组') >= 0)).assertTrue();
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0011 ' +
            'MaintenanceFlow.test:387 assertEqual actual',
          flow.integrity))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0011 ' +
              'MaintenanceFlow.test:387 assertEqual expected',
            'resource_match'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:388 assertEqual actual', flow.beforeBytes)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:388 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:389 assertEqual actual', flow.afterBytes)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:389 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:390 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:390 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:391 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:391 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:392 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:392 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:393 assertEqual actual', platform.configCalls)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0011 MaintenanceFlow.test:393 assertEqual expected', 2));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_1200
     * @tc.name      testMaintenanceFlow0012
     * @tc.desc      Verify module experiment uses module eviction targets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0012', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow('modules');
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:414 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0012 ' +
            'MaintenanceFlow.test:418 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0012 ' +
              'MaintenanceFlow.test:418 assertEqual expected',
            'completed'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:419 assertTrue actual', flow.steps[3].detail.indexOf('模块') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:420 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:420 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:421 assertEqual actual', platform.moduleCalls[0].join('|'))).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:421 assertEqual expected', 'entry|feature'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:422 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0012 MaintenanceFlow.test:422 assertEqual expected', 0));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0012 ' +
            'MaintenanceFlow.test:423 assertEqual actual',
          flow.integrity))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0012 ' +
              'MaintenanceFlow.test:423 assertEqual expected',
            'resource_match'));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_MAINTENANCEFLOW_1300
     * @tc.name      testMaintenanceFlow0013
     * @tc.desc      Verify changed workload bytes fail integrity even when length matches
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testMaintenanceFlow0013', async (): Promise<void> => {
      const platform = new MismatchResourcePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.runMaintenanceFlow('files');
        const flow = service.getState().maintenance;
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0013 MaintenanceFlow.test:444 assertTrue actual', flow !== undefined)).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0013 MaintenanceFlow.test:448 assertEqual actual', flow.beforeBytes)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0013 MaintenanceFlow.test:448 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0013 MaintenanceFlow.test:449 assertEqual actual', flow.afterBytes)).assertEqual(traceParameter('com.samples.appperformance_MaintenanceFlow_0013 MaintenanceFlow.test:449 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0013 MaintenanceFlow.test:450 assertFalse actual', flow.digestBefore === flow.digestAfter)).assertFalse();
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0013 ' +
            'MaintenanceFlow.test:451 assertEqual actual',
          flow.integrity))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0013 ' +
              'MaintenanceFlow.test:451 assertEqual expected',
            'resource_mismatch'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0013 ' +
            'MaintenanceFlow.test:452 assertEqual actual',
          flow.status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0013 ' +
              'MaintenanceFlow.test:452 assertEqual expected',
            'completed_with_failures'));
        expect(traceParameter(
          'com.samples.appperformance_MaintenanceFlow_0013 ' +
            'MaintenanceFlow.test:453 assertEqual actual',
          flow.steps[4].status))
          .assertEqual(traceParameter(
            'com.samples.appperformance_MaintenanceFlow_0013 ' +
              'MaintenanceFlow.test:453 assertEqual expected',
            'failed'));
        expect(traceParameter('com.samples.appperformance_MaintenanceFlow_0013 MaintenanceFlow.test:454 assertTrue actual', flow.notice.indexOf('校验') >= 0)).assertTrue();
      } finally {
        service.dispose();
      }
    });
  });
}
