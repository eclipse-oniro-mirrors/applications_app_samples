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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已完成');
        expect(flow.steps.length).assertEqual(6);
        expect(flow.steps.every((step: MaintenanceStep): boolean => step.status === '成功')).assertTrue();
        expect(flow.steps[0].detail.indexOf('3 个文件') >= 0).assertTrue();
        expect(flow.steps[1].detail.indexOf('配置有效') >= 0).assertTrue();
        expect(flow.steps[2].detail.indexOf('FNV') >= 0).assertTrue();
        expect(flow.steps[3].detail.indexOf('调用成功') >= 0).assertTrue();
        expect(flow.steps[4].detail.indexOf('业务资源校验一致') >= 0).assertTrue();
        expect(flow.steps[5].detail.indexOf('不代表驻留页已下降') >= 0).assertTrue();
        expect(flow.notice.indexOf('业务资源长度与校验值已比对') >= 0).assertTrue();
        expect(flow.notice.indexOf('仍需独立观测') >= 0).assertTrue();
        expect(platform.fileCalls.length).assertEqual(1);
        expect(platform.fileCalls[0].join('|')).assertEqual('libentry.so|entry.hap|shared.hsp');
        expect(platform.resourceCalls).assertEqual(2);
        expect(platform.configCalls).assertEqual(2);
        expect(service.getState().maintenanceBusy).assertFalse();
        expect(platform.pendingTimers()).assertEqual(0);
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已停止：配置无效，未下发回收');
        expect(status(flow, 0)).assertEqual('成功');
        expect(status(flow, 1)).assertEqual('失败');
        expect(status(flow, 2)).assertEqual('跳过');
        expect(status(flow, 3)).assertEqual('跳过');
        expect(status(flow, 4)).assertEqual('跳过');
        expect(status(flow, 5)).assertEqual('跳过');
        expect(platform.fileCalls.length).assertEqual(0);
        expect(platform.resourceCalls).assertEqual(0);
        expect(service.getState().maintenanceBusy).assertFalse();
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已停止：未发现可用目标');
        expect(status(flow, 0)).assertEqual('失败');
        expect(status(flow, 1)).assertEqual('跳过');
        expect(platform.configCalls).assertEqual(0);
        expect(platform.resourceCalls).assertEqual(0);
        expect(platform.fileCalls.length).assertEqual(0);
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已停止：工作负载读取失败，未下发回收');
        expect(status(flow, 2)).assertEqual('失败');
        expect(status(flow, 3)).assertEqual('跳过');
        expect(status(flow, 4)).assertEqual('跳过');
        expect(status(flow, 5)).assertEqual('跳过');
        expect(platform.fileCalls.length).assertEqual(0);
        expect(service.getState().maintenanceBusy).assertFalse();
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已停止：回收请求失败或被拦截');
        expect(status(flow, 3)).assertEqual('失败');
        expect(status(flow, 4)).assertEqual('跳过');
        expect(status(flow, 5)).assertEqual('跳过');
        expect(platform.fileCalls.length).assertEqual(1);
        expect(platform.pendingTimers()).assertEqual(0);
        expect(service.getState().memoryBusy).assertFalse();
        expect(service.getState().maintenanceBusy).assertFalse();
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已完成（含失败）');
        expect(status(flow, 3)).assertEqual('成功');
        expect(status(flow, 4)).assertEqual('成功');
        expect(status(flow, 5)).assertEqual('失败');
        expect(flow.steps[5].detail).assertEqual('配置回读与首次不一致');
        expect(flow.notice.indexOf('不得判定为零回收') >= 0).assertTrue();
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
        expect(service.getState().maintenanceBusy).assertTrue();
        await first;
        const flow = service.getState().maintenance;
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.id).assertEqual(1);
        expect(flow.status).assertEqual('已完成');
        expect(service.getState().maintenanceBusy).assertFalse();
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已停止：未发现可用目标');
        expect(flow.steps[0].detail.length > 0).assertTrue();
        expect(platform.configCalls).assertEqual(0);
        expect(platform.fileCalls.length).assertEqual(0);
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
        expect(platform.pendingTimers()).assertEqual(0);
        expect(platform.fileCalls.length).assertEqual(0);
        expect(service.getState().maintenanceBusy).assertFalse();
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.steps[2].detail.indexOf('12345') >= 0).assertTrue();
        expect(fixtureError(9, 'x').code).assertEqual(9);
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.mode).assertEqual('control');
        expect(flow.status).assertEqual('已完成');
        expect(flow.steps[3].detail.indexOf('对照组') >= 0).assertTrue();
        expect(flow.integrity).assertEqual('业务资源校验一致');
        expect(flow.beforeBytes).assertEqual(3);
        expect(flow.afterBytes).assertEqual(3);
        expect(platform.fileCalls.length).assertEqual(0);
        expect(platform.moduleCalls.length).assertEqual(0);
        expect(platform.resourceCalls).assertEqual(2);
        expect(platform.configCalls).assertEqual(2);
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.status).assertEqual('已完成');
        expect(flow.steps[3].detail.indexOf('模块') >= 0).assertTrue();
        expect(platform.moduleCalls.length).assertEqual(1);
        expect(platform.moduleCalls[0].join('|')).assertEqual('entry|feature');
        expect(platform.fileCalls.length).assertEqual(0);
        expect(flow.integrity).assertEqual('业务资源校验一致');
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
        expect(flow !== undefined).assertTrue();
        if (flow === undefined) {
          return;
        }
        expect(flow.beforeBytes).assertEqual(3);
        expect(flow.afterBytes).assertEqual(3);
        expect(flow.digestBefore === flow.digestAfter).assertFalse();
        expect(flow.integrity).assertEqual('业务资源校验不一致');
        expect(flow.status).assertEqual('已完成（含失败）');
        expect(flow.steps[4].status).assertEqual('失败');
        expect(flow.notice.indexOf('校验') >= 0).assertTrue();
      } finally {
        service.dispose();
      }
    });
  });
}
