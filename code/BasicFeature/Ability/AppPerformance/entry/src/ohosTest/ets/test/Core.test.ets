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
import { AppState, CallRecord } from '../../../main/ets/core/Types';
import { scenario } from '../support/BoundedCase';
import { FakePlatform, MemoryStore } from '../support/FakePlatform';

function latest(service: AppService, api: string): CallRecord {
  const record = service.getState().logs.find((value: CallRecord): boolean => value.api === api);
  if (record === undefined) {
    throw new Error(`Missing product call record: ${api}`);
  }
  return record;
}

function callById(service: AppService, id: number): CallRecord {
  const record = service.getState().logs.find((value: CallRecord): boolean => value.id === id);
  if (record === undefined) {
    throw new Error(`Missing product call id: ${id}`);
  }
  return record;
}

function snapshotMemory(state: AppState): CallRecord {
  const record = state.latestMemory;
  if (record === undefined) {
    throw new Error('Missing product memory summary');
  }
  return record;
}

export default function coreTests(): void {
  describe('AppPerformanceCore', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0100
     * @tc.name      testAppPerformanceCore0001
     * @tc.desc      Verify 文件参数：三后缀、trim去重及非法输入本地拦截
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0001', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.evictFiles([' libentry.so ', 'entry.hap', 'shared.hsp', 'libentry.so', ' entry.hap ']);
        expect(platform.fileCalls.length).assertEqual(1);
        expect(platform.fileCalls[0].join('|')).assertEqual('libentry.so|entry.hap|shared.hsp');
        expect(latest(service, 'evictFilePages').kind).assertEqual('success');
        const tooMany: string[] = [];
        for (let index = 0; index < 33; index++) {
          tooMany.push(`library${index}.so`);
        }
        const invalid: string[][] = [
          [], [''], ['   '], ['notes.txt'], ['entry.HAP'], ['../libentry.so'],
          ['nested/entry.hap'], ['nested\\shared.hsp'], ['C:\\libentry.so'], ['bad\nname.so'], tooMany
        ];
        platform.fileCalls = [];
        for (let index = 0; index < invalid.length; index++) {
          await service.evictFiles(invalid[index]);
          expect(latest(service, 'evictFilePages').kind).assertEqual('blocked');
          expect(platform.fileCalls.length).assertEqual(0);
          expect(service.getState().memoryBusy).assertFalse();
        }
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0200
     * @tc.name      testAppPerformanceCore0002
     * @tc.desc      Verify 文件回收：pending到success、原始拒绝码及sdk不可用
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0002', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        platform.deferFile = true;
        const pending = service.evictFiles(['libentry.so']);
        const waiting = latest(service, 'evictFilePages');
        expect(waiting.kind).assertEqual('pending');
        expect(service.getState().memoryBusy).assertTrue();
        expect(platform.fileCalls.length).assertEqual(1);
        platform.advance(37);
        platform.releaseFile();
        await pending;
        const success = callById(service, waiting.id);
        expect(success.kind).assertEqual('success');
        expect(success.code).assertEqual(0);
        expect(success.elapsed).assertEqual(37);
        expect(success.late).assertFalse();
        expect(service.getState().memoryBusy).assertFalse();

        platform.deferFile = false;
        platform.fileErrorCode = 16000163;
        await service.evictFiles(['entry.hap']);
        const failure = latest(service, 'evictFilePages');
        expect(failure.kind).assertEqual('error');
        expect(failure.code).assertEqual(16000163);
        expect(failure.message).assertEqual('fixture file rejection');
        expect(service.getState().notice).assertEqual('调用失败');
        expect(service.getState().memoryBusy).assertFalse();

        platform.fileAvailable = false;
        const dispatched = platform.fileCalls.length;
        await service.evictFiles(['shared.hsp']);
        expect(platform.fileCalls.length).assertEqual(dispatched);
        expect(latest(service, 'evictFilePages').kind).assertEqual('blocked');
        expect(latest(service, 'evictFilePages').message).assertEqual('请升级系统');
      } finally {
        platform.releaseFile();
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0300
     * @tc.name      testAppPerformanceCore0003
     * @tc.desc      Verify 模块与配置：真实names去重、无效模块、配置错误及原始拒绝码
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0003', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.modules = ['entry', 'feature', 'entry'];
      platform.files = ['libs/libentry.so', 'entry.hap', 'shared.hsp', 'libs/libentry.so', 'notes.txt'];
      const service = AppService.fromPlatform(platform);
      try {
        service.refreshTargets();
        expect(service.getState().modules.join('|')).assertEqual('entry|feature');
        expect(service.getState().files.join('|')).assertEqual('entry.hap|libentry.so|shared.hsp');
        service.checkConfig();
        expect(platform.configCalls).assertEqual(1);
        expect(service.getState().configText).assertEqual(platform.config.trim());
        expect(service.getState().configStatus).assertEqual('配置有效');
        expect(latest(service, 'getRawFileContentSync').kind).assertEqual('success');

        platform.config = '{"unexpected":[]}';
        service.checkConfig();
        expect(service.getState().configStatus).assertEqual('配置无效');
        expect(latest(service, 'getRawFileContentSync').kind).assertEqual('error');
        platform.config = '{';
        service.checkConfig();
        expect(service.getState().configStatus).assertEqual('配置读取失败');
        expect(latest(service, 'getRawFileContentSync').kind).assertEqual('error');
        expect(platform.configCalls).assertEqual(3);

        // Config diagnostics are not a product gate for otherwise valid real modules.
        await service.evictModules([' entry ', 'feature', 'entry']);
        expect(platform.moduleCalls.length).assertEqual(1);
        expect(platform.moduleCalls[0].join('|')).assertEqual('entry|feature');
        expect(latest(service, 'evictModuleFilePages').kind).assertEqual('success');
        await service.evictModules(['not-a-real-module']);
        expect(platform.moduleCalls.length).assertEqual(1);
        expect(latest(service, 'evictModuleFilePages').kind).assertEqual('blocked');
        expect(latest(service, 'evictModuleFilePages').message).assertEqual('请选择真实模块');

        platform.moduleErrorCode = 16000164;
        await service.evictModules(['entry']);
        expect(platform.moduleCalls.length).assertEqual(2);
        expect(latest(service, 'evictModuleFilePages').kind).assertEqual('error');
        expect(latest(service, 'evictModuleFilePages').code).assertEqual(16000164);
        expect(latest(service, 'evictModuleFilePages').message).assertEqual('fixture module rejection');
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0400
     * @tc.name      testAppPerformanceCore0004
     * @tc.desc      Verify 资源：先校验拦截、baseline字节一致与变化、读取失败
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0004', async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = AppService.fromPlatform(platform);
      try {
        await service.verifyResource();
        expect(platform.resourceCalls).assertEqual(0);
        expect(latest(service, 'getRawFileContent').kind).assertEqual('blocked');
        expect(service.getState().notice).assertEqual('请先读取资源');

        await service.readResource();
        expect(platform.resourceCalls).assertEqual(1);
        expect(service.getState().resourceText.indexOf('3 字节') >= 0).assertTrue();
        expect(latest(service, 'getRawFileContent').kind).assertEqual('success');
        platform.resource = new Uint8Array([65, 66, 67]);
        await service.verifyResource();
        expect(service.getState().notice).assertEqual('校验一致');
        expect(latest(service, 'getRawFileContent').message).assertEqual('校验一致');
        platform.resource[2] = 68;
        await service.verifyResource();
        expect(service.getState().notice).assertEqual('校验不一致');
        expect(latest(service, 'getRawFileContent').message).assertEqual('校验不一致');

        platform.resourceErrorCode = 13400001;
        await service.readResource();
        expect(service.getState().resourceText).assertEqual('读取失败');
        expect(service.getState().resourceBusy).assertFalse();
        expect(latest(service, 'getRawFileContent').kind).assertEqual('error');
        expect(latest(service, 'getRawFileContent').code).assertEqual(13400001);
        await service.verifyResource();
        expect(service.getState().resourceText).assertEqual('校验失败');
        expect(service.getState().resourceBusy).assertFalse();
        expect(platform.resourceCalls).assertEqual(5);
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0500
     * @tc.name      testAppPerformanceCore0005
     * @tc.desc      Verify 快启：true/false、本地记录、失败保留值与串行持久化恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0005', async (): Promise<void> => {
      const store = new MemoryStore();
      const platform = new FakePlatform(store);
      const service = AppService.fromPlatform(platform);
      try {
        service.setSnapEnabled(true);
        expect(platform.snapCalls.length).assertEqual(1);
        expect(platform.snapCalls[0]).assertTrue();
        expect(service.getState().snapFlag).assertEqual('启用');
        expect(latest(service, 'setHyperSnapEnabled').kind).assertEqual('success');
        platform.advance(25);
        service.setSnapEnabled(false);
        expect(platform.snapCalls.length).assertEqual(2);
        expect(platform.snapCalls[1]).assertFalse();
        const saved = service.getState();
        expect(saved.snapFlag).assertEqual('禁用');
        expect(saved.snapAt).assertEqual(platform.wallNow());
        expect(latest(service, 'setHyperSnapEnabled').kind).assertEqual('success');

        platform.advance(25);
        platform.setErrorCode = 16000150;
        service.setSnapEnabled(true);
        expect(platform.snapCalls.length).assertEqual(3);
        expect(service.getState().snapFlag).assertEqual('禁用');
        expect(service.getState().snapAt).assertEqual(saved.snapAt);
        expect(latest(service, 'setHyperSnapEnabled').kind).assertEqual('error');
        expect(latest(service, 'setHyperSnapEnabled').code).assertEqual(16000150);
        await service.whenSaved();
        expect(store.value.length > 0).assertTrue();
        expect(store.writeCalls.length > 0).assertTrue();

        // A distinct platform has its own clock, but shares only the in-memory store.
        const restoredPlatform = new FakePlatform(store);
        const restored = AppService.fromPlatform(restoredPlatform);
        try {
          expect(restored.getState().snapFlag).assertEqual('禁用');
          expect(restored.getState().snapAt).assertEqual(saved.snapAt);
          expect(latest(restored, 'setHyperSnapEnabled').kind).assertEqual('error');
          expect(latest(restored, 'setHyperSnapEnabled').code).assertEqual(16000150);
          expect(restoredPlatform.snapCalls.length).assertEqual(0);
          expect(restored.getState().storageMessage).assertEqual('');
        } finally {
          restored.dispose();
        }
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0600
     * @tc.name      testAppPerformanceCore0006
     * @tc.desc      Verify 重建：成功冷却、虚拟十秒、存储失败不绕过及原始异常码
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0006', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.store.writeFailure = true;
      const service = AppService.fromPlatform(platform);
      try {
        service.rebuildSnap('第一次');
        expect(platform.rebuildCalls).assertEqual(1);
        expect(latest(service, 'requestRebuildHyperSnap').kind).assertEqual('success');
        expect(service.getState().rebuildWaitSeconds).assertEqual(10);
        await service.whenSaved();
        expect(service.getState().storageMessage).assertEqual('存储写入失败');
        service.rebuildSnap('立即重复');
        expect(platform.rebuildCalls).assertEqual(1);
        expect(latest(service, 'requestRebuildHyperSnap').kind).assertEqual('blocked');
        expect(service.getState().rebuildWaitSeconds).assertEqual(10);

        platform.advance(10000);
        expect(service.getState().rebuildWaitSeconds).assertEqual(0);
        service.rebuildSnap('冷却结束');
        expect(platform.rebuildCalls).assertEqual(2);
        expect(latest(service, 'requestRebuildHyperSnap').kind).assertEqual('success');
        const lastSuccessAt = service.getState().rebuildAt;
        platform.advance(10000);
        platform.rebuildErrorCode = 16000150;
        service.rebuildSnap('系统拒绝');
        expect(platform.rebuildCalls).assertEqual(3);
        expect(latest(service, 'requestRebuildHyperSnap').kind).assertEqual('error');
        expect(latest(service, 'requestRebuildHyperSnap').code).assertEqual(16000150);
        expect(latest(service, 'requestRebuildHyperSnap').message).assertEqual('fixture rebuild rejection');
        expect(service.getState().rebuildAt).assertEqual(lastSuccessAt);
        expect(service.getState().rebuildWaitSeconds).assertEqual(0);
        await service.whenSaved();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCECORE_0700
     * @tc.name      testAppPerformanceCore0007
     * @tc.desc      Verify 内存虚拟超时：保持锁、同id迟到成功及订阅与快照隔离
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceCore0007', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.deferFile = true;
      const service = AppService.fromPlatform(platform);
      let notifications: number = 0;
      const listener = service.subscribe((): void => { notifications++; });
      try {
        const pending = service.evictFiles(['libentry.so']);
        const original = service.getState();
        const memory = snapshotMemory(original);
        const id = memory.id;
        expect(memory.kind).assertEqual('pending');
        expect(original.memoryBusy).assertTrue();
        expect(notifications > 0).assertTrue();
        const beforeTimeout = notifications;
        platform.advance(10000);
        expect(callById(service, id).kind).assertEqual('timeout');
        expect(callById(service, id).elapsed).assertEqual(10000);
        expect(service.getState().memoryBusy).assertTrue();
        expect(notifications > beforeTimeout).assertTrue();
        expect(memory.kind).assertEqual('pending');
        expect(original.logs[0].kind).assertEqual('pending');

        await service.evictFiles(['entry.hap']);
        expect(platform.fileCalls.length).assertEqual(1);
        expect(latest(service, 'evictFilePages').kind).assertEqual('blocked');
        expect(service.getState().memoryBusy).assertTrue();
        expect(callById(service, id).kind).assertEqual('timeout');
        const beforeRelease = notifications;
        platform.releaseFile();
        platform.releaseFile();
        await pending;
        const finished = callById(service, id);
        expect(finished.kind).assertEqual('success');
        expect(finished.code).assertEqual(0);
        expect(finished.late).assertTrue();
        expect(finished.elapsed).assertEqual(10000);
        expect(service.getState().memoryBusy).assertFalse();
        expect(service.getState().logs.filter((value: CallRecord): boolean => value.id === id).length).assertEqual(1);
        expect(platform.fileCalls.length).assertEqual(1);
        expect(platform.pendingTimers()).assertEqual(0);
        expect(notifications > beforeRelease).assertTrue();
        expect(memory.kind).assertEqual('pending');
        expect(memory.late).assertFalse();
        expect(original.memoryBusy).assertTrue();
        expect(original.logs[0].kind).assertEqual('pending');

        service.unsubscribe(listener);
        const afterUnsubscribe = notifications;
        service.setForeground(false);
        service.setForeground(true);
        expect(notifications).assertEqual(afterUnsubscribe);
      } finally {
        platform.releaseFile();
        service.unsubscribe(listener);
        service.dispose();
      }
    });
  });
}
