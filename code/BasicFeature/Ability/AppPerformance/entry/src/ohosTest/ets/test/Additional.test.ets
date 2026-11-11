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
import { CallRecord, LaunchSample } from '../../../main/ets/core/Types';
import { scenario } from '../support/BoundedCase';
import { FakePlatform, MemoryStore, fixtureError } from '../support/FakePlatform';
import { CopyPlatform, ResourcePlatform, RejectionPlatform, MissingStorePlatform, SerialStore,
  flushCoverageMicrotasks } from '../support/CoveragePlatform';

interface StoredFixture {
  schema: number;
  nextId: number;
  snapFlag: string;
  snapAt: number;
  rebuildAt: number;
  logs: CallRecord[];
  launches: LaunchSample[];
}

type ServiceBody = (service: AppService) => void | Promise<void>;

async function withService(platform: FakePlatform, body: ServiceBody): Promise<void> {
  const service = AppService.fromPlatform(platform);
  try {
    await body(service);
  } finally {
    service.dispose();
    platform.releaseFile();
  }
}

function latest(service: AppService, api: string): CallRecord {
  const row = service.getState().logs.find((value: CallRecord): boolean => value.api === api);
  if (row === undefined) {
    throw new Error(`Missing record: ${api}`);
  }
  return row;
}

function byId(service: AppService, id: number): CallRecord {
  const row = service.getState().logs.find((value: CallRecord): boolean => value.id === id);
  if (row === undefined) {
    throw new Error(`Missing record id: ${id}`);
  }
  return row;
}

function storedFixture(): StoredFixture {
  return {
    schema: 2,
    nextId: 1,
    snapFlag: '',
    snapAt: 0,
    rebuildAt: 0,
    logs: [],
    launches: []
  };
}

function storedCall(id: number, kind: string = 'success', api: string = 'setHyperSnapEnabled'): CallRecord {
  return {
    id: id,
    api: api,
    target: 'fixture',
    status: 'fixture',
    kind: kind,
    at: 1700000000000,
    elapsed: 25,
    code: 0,
    message: 'fixture',
    late: false
  };
}

function storedLaunch(id: string): LaunchSample {
  return {
    id: id,
    group: '初始',
    at: 1700000000000,
    contentMs: 12,
    device: 'fixture',
    appVersion: '1.fixture'
  };
}

export default function additionalTests(): void {
  describe('AppPerformanceAdditional', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0100
     * @tc.name      testAppPerformanceAdditional0001
     * @tc.desc      Verify 文件边界：255字符与32个唯一目标可用，256字符拒绝
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0001', async (): Promise<void> => {
      const platform = new FakePlatform();
      await withService(platform, async (service: AppService): Promise<void> => {
        const boundary = `${'a'.repeat(252)}.so`;
        const targets: string[] = [boundary];
        for (let index = 1; index < 32; index++) {
          targets.push(`lib${index}.so`);
        }
        await service.evictFiles(targets.concat([boundary, ' lib1.so ']));
        expect(platform.fileCalls.length).assertEqual(1);
        expect(platform.fileCalls[0].length).assertEqual(32);
        expect(platform.fileCalls[0][0].length).assertEqual(255);
        expect(latest(service, 'evictFilePages').kind).assertEqual('success');
        await service.evictFiles([`${'b'.repeat(253)}.so`]);
        expect(platform.fileCalls.length).assertEqual(1);
        expect(latest(service, 'evictFilePages').kind).assertEqual('blocked');
        expect(platform.pendingTimers()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0200
     * @tc.name      testAppPerformanceAdditional0002
     * @tc.desc      Verify 模块边界：空值、33项及缺失接口均不下发
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0002', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.modules = [];
      for (let index = 0; index < 33; index++) {
        platform.modules.push(`module${index}`);
      }
      await withService(platform, async (service: AppService): Promise<void> => {
        service.refreshTargets();
        await service.evictModules(platform.modules.slice(0, 32));
        expect(platform.moduleCalls[0].length).assertEqual(32);
        for (const targets of [[], ['  '], platform.modules]) {
          await service.evictModules(targets);
          expect(latest(service, 'evictModuleFilePages').kind).assertEqual('blocked');
        }
        platform.moduleAvailable = false;
        await service.evictModules(['module0']);
        expect(latest(service, 'evictModuleFilePages').message).assertEqual('请升级系统');
        expect(platform.moduleCalls.length).assertEqual(1);
        expect(service.getState().memoryBusy).assertFalse();
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0300
     * @tc.name      testAppPerformanceAdditional0003
     * @tc.desc      Verify 目标发现：目录与模块读取失败独立记录且允许恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0003', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.bundleErrorCode = 17700001;
      platform.listErrorCode = 13900012;
      await withService(platform, (service: AppService): void => {
        service.refreshTargets();
        expect(service.getState().files.length).assertEqual(0);
        expect(service.getState().modules.length).assertEqual(0);
        expect(service.getState().targetMessage.indexOf('可手动输入文件名') >= 0).assertTrue();
        expect(latest(service, 'getBundleInfoForSelfSync').code).assertEqual(17700001);
        expect(latest(service, 'listFileSync').code).assertEqual(13900012);
        platform.bundleErrorCode = -1;
        platform.listErrorCode = -1;
        platform.files = ['z.hsp', 'nested/a.hap', 'a.hap', 'bad.TXT', 'nested/b.so'];
        platform.modules = ['entry', '', 'entry', 'feature'];
        service.refreshTargets();
        expect(service.getState().files.join('|')).assertEqual('a.hap|b.so|z.hsp');
        expect(service.getState().modules.join('|')).assertEqual('entry|feature');
        expect(service.getState().targetMessage).assertEqual('3 个文件 · 2 个模块');
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0400
     * @tc.name      testAppPerformanceAdditional0004
     * @tc.desc      Verify 配置边界：空数组、33项、非字符串及读取异常
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0004', async (): Promise<void> => {
      const platform = new FakePlatform();
      await withService(platform, (service: AppService): void => {
        const names: string[] = [];
        for (let index = 0; index < 32; index++) {
          names.push(`lib${index}.so`);
        }
        platform.config = JSON.stringify({ evictFilePages: names });
        service.checkConfig();
        expect(service.getState().configStatus).assertEqual('配置有效');
        expect(latest(service, 'getRawFileContentSync').message).assertEqual('32 项');
        const invalid = ['null', '{"evictFilePages":[]}', '{"evictFilePages":[1]}',
          '{"evictFilePages":["../entry.hap"]}', JSON.stringify({ evictFilePages: names.concat(['extra.so']) })];
        invalid.forEach((text: string): void => {
          platform.config = text;
          service.checkConfig();
          expect(service.getState().configStatus).assertEqual('配置无效');
          expect(latest(service, 'getRawFileContentSync').kind).assertEqual('error');
        });
        platform.configErrorCode = 13400001;
        service.checkConfig();
        expect(service.getState().configStatus).assertEqual('配置读取失败');
        expect(latest(service, 'getRawFileContentSync').code).assertEqual(13400001);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0500
     * @tc.name      testAppPerformanceAdditional0005
     * @tc.desc      Verify 资源并发：读取期间重复读取及校验不覆盖在途请求
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0005', async (): Promise<void> => {
      const platform = new ResourcePlatform();
      await withService(platform, async (service: AppService): Promise<void> => {
        const pending = service.readResource();
        expect(service.getState().resourceBusy).assertTrue();
        await service.readResource();
        expect(latest(service, 'getRawFileContent').message).assertEqual('资源读取中');
        await service.verifyResource();
        expect(latest(service, 'getRawFileContent').kind).assertEqual('blocked');
        expect(platform.resourceCalls).assertEqual(1);
        expect(service.getState().resourceBusy).assertTrue();
        platform.releaseResource(new Uint8Array([65, 66]));
        await pending;
        expect(service.getState().resourceBusy).assertFalse();
        expect(service.getState().resourceText.indexOf('2 字节') >= 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0600
     * @tc.name      testAppPerformanceAdditional0006
     * @tc.desc      Verify 资源长度变化及空文件：baseline独立且重读可替换
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0006', async (): Promise<void> => {
      const platform = new FakePlatform();
      await withService(platform, async (service: AppService): Promise<void> => {
        await service.readResource();
        platform.resource = new Uint8Array([65, 66]);
        await service.verifyResource();
        expect(service.getState().notice).assertEqual('校验不一致');
        await service.readResource();
        await service.verifyResource();
        expect(service.getState().notice).assertEqual('校验一致');
        platform.resource = new Uint8Array(0);
        await service.verifyResource();
        expect(service.getState().notice).assertEqual('校验不一致');
        await service.readResource();
        await service.verifyResource();
        expect(service.getState().resourceText).assertEqual('校验一致 · 0 字节');
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0700
     * @tc.name      testAppPerformanceAdditional0007
     * @tc.desc      Verify 内存迟到拒绝：跨文件模块单飞与原id失败记录
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0007', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.deferFile = true;
      platform.fileErrorCode = 16000163;
      await withService(platform, async (service: AppService): Promise<void> => {
        service.refreshTargets();
        const pending = service.evictFiles(['entry.hap']);
        const id = latest(service, 'evictFilePages').id;
        platform.advance(9999);
        expect(byId(service, id).kind).assertEqual('pending');
        await service.evictModules(['entry']);
        expect(platform.moduleCalls.length).assertEqual(0);
        expect(latest(service, 'evictModuleFilePages').message).assertEqual('上一调用仍在等待');
        platform.advance(1);
        expect(byId(service, id).kind).assertEqual('timeout');
        platform.releaseFile();
        await pending;
        expect(byId(service, id).kind).assertEqual('error');
        expect(byId(service, id).code).assertEqual(16000163);
        expect(byId(service, id).late).assertTrue();
        expect(service.getState().memoryBusy).assertFalse();
        expect(platform.pendingTimers()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0800
     * @tc.name      testAppPerformanceAdditional0008
     * @tc.desc      Verify 快启能力缺失：无调用无冷却，重建原因归一化
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0008', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.setAvailable = false;
      platform.rebuildAvailable = false;
      await withService(platform, (service: AppService): void => {
        service.setSnapEnabled(true);
        service.rebuildSnap('  test  ');
        expect(platform.snapCalls.length).assertEqual(0);
        expect(platform.rebuildCalls).assertEqual(0);
        expect(service.getState().snapFlag).assertEqual('尚未设置');
        expect(service.getState().rebuildWaitSeconds).assertEqual(0);
        expect(platform.pendingTimers()).assertEqual(0);
        platform.rebuildAvailable = true;
        service.rebuildSnap(' \n\t ');
        expect(latest(service, 'requestRebuildHyperSnap').target).assertEqual('手动重建');
        platform.advance(10000);
        service.rebuildSnap(` \n${'x'.repeat(250)}\t `);
        expect(latest(service, 'requestRebuildHyperSnap').target).assertEqual('x'.repeat(200));
        expect(platform.rebuildCalls).assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_0900
     * @tc.name      testAppPerformanceAdditional0009
     * @tc.desc      Verify 在途上限：32次复制后拦截，释放后恢复
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0009', async (): Promise<void> => {
      const platform = new CopyPlatform();
      try {
        await withService(platform, async (service: AppService): Promise<void> => {
          const pending: Promise<void>[] = [];
          for (let index = 0; index < 32; index++) {
            pending.push(service.copyText(`pending-${index}`));
          }
          await service.copyText('blocked-copy');
          expect(platform.copiedTexts.length).assertEqual(32);
          expect(platform.copiedTexts.indexOf('blocked-copy')).assertEqual(-1);
          expect(latest(service, 'setData').kind).assertEqual('blocked');
          expect(latest(service, 'setData').message).assertEqual('在途调用过多');
          platform.finishAll();
          await Promise.all(pending);
          const next = service.copyText('allowed-copy');
          expect(platform.copiedTexts.length).assertEqual(33);
          expect(platform.copiedTexts[32]).assertEqual('allowed-copy');
          platform.resolveAt(32);
          await next;
          expect(latest(service, 'setData').kind).assertEqual('success');
          expect(service.getState().notice).assertEqual('已复制');
        });
      } finally {
        platform.finishAll();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1000
     * @tc.name      testAppPerformanceAdditional0010
     * @tc.desc      Verify 清理记录：保留在途记录直至结算再清理摘要
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0010', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.deferFile = true;
      await withService(platform, async (service: AppService): Promise<void> => {
        service.setSnapEnabled(true);
        const pending = service.evictFiles(['entry.hap']);
        const id = latest(service, 'evictFilePages').id;
        service.clearLogs();
        expect(service.getState().logs.length).assertEqual(1);
        expect(service.getState().logs[0].id).assertEqual(id);
        expect(service.getState().latestMemory?.id).assertEqual(id);
        expect(service.getState().memoryBusy).assertTrue();
        platform.releaseFile();
        await pending;
        expect(byId(service, id).kind).assertEqual('success');
        service.clearLogs();
        expect(service.getState().logs.length).assertEqual(0);
        expect(service.getState().latestMemory).assertUndefined();
        expect(service.getState().snapFlag).assertEqual('启用');
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1100
     * @tc.name      testAppPerformanceAdditional0011
     * @tc.desc      Verify 日志容量：满100条不丢在途请求，结算保持唯一id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0011', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.deferFile = true;
      await withService(platform, async (service: AppService): Promise<void> => {
        const pending = service.evictFiles(['entry.hap']);
        const id = latest(service, 'evictFilePages').id;
        for (let index = 0; index < 105; index++) {
          service.setSnapEnabled(index % 2 === 0);
        }
        expect(service.getState().logs.length).assertEqual(100);
        expect(byId(service, id).kind).assertEqual('pending');
        platform.advance(23);
        platform.releaseFile();
        await pending;
        const rows = service.getState().logs;
        expect(rows.length).assertEqual(100);
        expect(rows.filter((row: CallRecord): boolean => row.id === id).length).assertEqual(1);
        expect(byId(service, id).elapsed).assertEqual(23);
        expect(byId(service, id).kind).assertEqual('success');
        await service.whenSaved();
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1200
     * @tc.name      testAppPerformanceAdditional0012
     * @tc.desc      Verify 存储异常：坏json、旧schema、读失败及打开失败可继续调用
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0012', async (): Promise<void> => {
      const corrupted = new MemoryStore();
      corrupted.value = '{';
      await withService(new FakePlatform(corrupted), (service: AppService): void => {
        expect(service.getState().storageMessage).assertEqual('存储读取失败');
        service.setSnapEnabled(true);
        expect(service.getState().snapFlag).assertEqual('启用');
      });
      const legacy = new MemoryStore();
      legacy.value = '{"schema":1}';
      await withService(new FakePlatform(legacy), (service: AppService): void => {
        expect(service.getState().storageMessage).assertEqual('存储数据已重置');
        expect(service.getState().logs.length).assertEqual(0);
      });
      const unreadable = new MemoryStore();
      unreadable.readFailure = true;
      await withService(new FakePlatform(unreadable), (service: AppService): void => {
        expect(service.getState().storageMessage).assertEqual('存储读取失败');
      });
      await withService(new MissingStorePlatform(), (service: AppService): void => {
        service.setSnapEnabled(false);
        expect(service.getState().storageMessage).assertEqual('存储不可用');
        expect(latest(service, 'setHyperSnapEnabled').kind).assertEqual('success');
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1300
     * @tc.name      testAppPerformanceAdditional0013
     * @tc.desc      Verify 存储恢复：非法重复项过滤、在途转结束、id不复用
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0013', async (): Promise<void> => {
      const data = storedFixture();
      const bad = storedCall(-1);
      const tooLong = storedCall(99);
      tooLong.api = 'x'.repeat(121);
      data.logs = [storedCall(40, 'pending', 'evictFilePages'),
        storedCall(39, 'timeout', 'evictModuleFilePages'), storedCall(38), storedCall(38), bad, tooLong];
      const badLaunch = storedLaunch('invalid');
      badLaunch.contentMs = -1;
      data.launches = [storedLaunch('kept'), storedLaunch('kept'), badLaunch];
      data.snapFlag = '启用';
      data.snapAt = 1700000000000;
      const store = new MemoryStore();
      store.value = JSON.stringify(data);
      await withService(new FakePlatform(store), (service: AppService): void => {
        expect(service.getState().logs.length).assertEqual(3);
        expect(byId(service, 40).status).assertEqual('进程已结束');
        expect(byId(service, 39).code).assertEqual(-1);
        expect(byId(service, 39).late).assertFalse();
        expect(service.getState().latestMemory?.id).assertEqual(40);
        expect(service.getState().launches.length).assertEqual(1);
        expect(service.getState().launches[0].id).assertEqual('kept');
        expect(service.getState().snapFlag).assertEqual('启用');
        service.setSnapEnabled(false);
        expect(latest(service, 'setHyperSnapEnabled').id).assertEqual(41);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1400
     * @tc.name      testAppPerformanceAdditional0014
     * @tc.desc      Verify 启动样本容量：恢复最多60条，新样本淘汰末项
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0014', async (): Promise<void> => {
      const data = storedFixture();
      for (let index = 0; index < 65; index++) {
        data.launches.push(storedLaunch(`old-${index}`));
      }
      const store = new MemoryStore();
      store.value = JSON.stringify(data);
      await withService(new FakePlatform(store), async (service: AppService): Promise<void> => {
        expect(service.getState().launches.length).assertEqual(60);
        expect(service.getState().launches[59].id).assertEqual('old-59');
        service.markContentLoaded();
        expect(service.getState().launches.length).assertEqual(60);
        expect(service.getState().launches[1].id).assertEqual('old-0');
        expect(service.getState().launches[59].id).assertEqual('old-58');
        await service.whenSaved();
        expect((JSON.parse(store.value) as StoredFixture).launches.length).assertEqual(60);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1500
     * @tc.name      testAppPerformanceAdditional0015
     * @tc.desc      Verify 启动生命周期：一次内容加载只记一次，分组固定在本次创建
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0015', async (): Promise<void> => {
      const data = storedFixture();
      data.snapFlag = '禁用';
      data.snapAt = 1700000000000;
      const store = new MemoryStore();
      store.value = JSON.stringify(data);
      const platform = new FakePlatform(store);
      await withService(platform, async (service: AppService): Promise<void> => {
        const startedAt = platform.wallNow();
        service.setSnapEnabled(true);
        platform.advance(45);
        service.markContentLoaded();
        platform.advance(100);
        service.markContentLoaded();
        const rows = service.getState().launches;
        expect(rows.length).assertEqual(1);
        expect(rows[0].group).assertEqual('禁用');
        expect(rows[0].contentMs).assertEqual(45);
        expect(rows[0].at).assertEqual(startedAt);
        expect(rows[0].device).assertEqual(platform.environmentText);
        expect(rows[0].appVersion).assertEqual(platform.versionName);
        await service.whenSaved();
        expect((JSON.parse(store.value) as StoredFixture).launches[0].id).assertEqual(rows[0].id);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1600
     * @tc.name      testAppPerformanceAdditional0016
     * @tc.desc      Verify 启动元信息失败：仍保存样本且清空采样不清调用日志
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0016', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.bundleErrorCode = 17700001;
      await withService(platform, async (service: AppService): Promise<void> => {
        platform.advance(5);
        service.markContentLoaded();
        expect(service.getState().launches[0].appVersion).assertEqual('读取失败');
        expect(service.getState().launches[0].contentMs).assertEqual(5);
        expect(latest(service, 'getBundleInfoForSelfSync').code).assertEqual(17700001);
        const count = service.getState().logs.length;
        service.clearLaunches();
        expect(service.getState().launches.length).assertEqual(0);
        expect(service.getState().logs.length).assertEqual(count);
        await service.whenSaved();
        expect((JSON.parse(platform.store.value) as StoredFixture).launches.length).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1700
     * @tc.name      testAppPerformanceAdditional0017
     * @tc.desc      Verify 串行持久化：首写失败不阻塞后写，最终快照为最新设置
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0017', async (): Promise<void> => {
      const store = new SerialStore();
      const platform = new FakePlatform(store);
      const service = AppService.fromPlatform(platform);
      try {
        service.setSnapEnabled(true);
        service.setSnapEnabled(false);
        let saved = false;
        const completed = service.whenSaved().then((): void => { saved = true; });
        await flushCoverageMicrotasks();
        expect(store.writeCalls.length).assertEqual(1);
        expect(saved).assertFalse();
        store.release(true);
        await flushCoverageMicrotasks();
        expect(store.writeCalls.length).assertEqual(2);
        expect(service.getState().storageMessage).assertEqual('存储写入失败');
        for (let index = 2; index <= 4; index++) {
          expect(store.writeCalls.length).assertEqual(index);
          store.release();
          await flushCoverageMicrotasks();
        }
        await completed;
        expect(saved).assertTrue();
        expect(store.writeCalls.length).assertEqual(4);
        expect(service.getState().storageMessage).assertEqual('');
        const finalState = JSON.parse(store.value) as StoredFixture;
        expect(finalState.snapFlag).assertEqual('禁用');
        expect(finalState.logs[0].kind).assertEqual('success');
        expect(finalState.logs[0].target).assertEqual('禁用');
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1800
     * @tc.name      testAppPerformanceAdditional0018
     * @tc.desc      Verify 状态快照隔离：目标、日志及启动样本均不可反向修改
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0018', async (): Promise<void> => {
      const platform = new FakePlatform();
      await withService(platform, async (service: AppService): Promise<void> => {
        service.refreshTargets();
        service.markContentLoaded();
        const copy = service.getState();
        copy.files[0] = 'modified.so';
        copy.modules.push('injected');
        copy.logs[0].message = 'modified';
        copy.launches[0].device = 'modified';
        copy.launches.pop();
        const unchanged = service.getState();
        expect(unchanged.files.indexOf('modified.so')).assertEqual(-1);
        expect(unchanged.modules.indexOf('injected')).assertEqual(-1);
        expect(unchanged.logs[0].message === 'modified').assertFalse();
        expect(unchanged.launches.length).assertEqual(1);
        expect(unchanged.launches[0].device).assertEqual(platform.environmentText);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_1900
     * @tc.name      testAppPerformanceAdditional0019
     * @tc.desc      Verify 订阅及销毁：异常监听不改结果，销毁清理两类定时器
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0019', async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.deferFile = true;
      const service = AppService.fromPlatform(platform);
      let notices = 0;
      service.subscribe((): void => { throw new Error('fixture listener failure'); });
      service.subscribe((): void => { notices++; });
      try {
        service.setForeground(false);
        const firstCount = notices;
        service.setForeground(false);
        expect(notices).assertEqual(firstCount);
        const pending = service.evictFiles(['entry.hap']);
        service.rebuildSnap('dispose-test');
        expect(latest(service, 'requestRebuildHyperSnap').kind).assertEqual('success');
        expect(platform.pendingTimers()).assertEqual(2);
        service.dispose();
        service.dispose();
        expect(platform.pendingTimers()).assertEqual(0);
        const disposedCount = notices;
        platform.advance(20000);
        platform.releaseFile();
        await pending;
        expect(notices).assertEqual(disposedCount);
        expect(service.getState().memoryBusy).assertFalse();
        expect(latest(service, 'evictFilePages').kind).assertEqual('success');
      } finally {
        platform.releaseFile();
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_2000
     * @tc.name      testAppPerformanceAdditional0020
     * @tc.desc      Verify 剪贴板：原文不截断，失败保留系统码且可重试
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0020', async (): Promise<void> => {
      const platform = new FakePlatform();
      await withService(platform, async (service: AppService): Promise<void> => {
        const text = `line1\nline2\t${'x'.repeat(5000)}`;
        await service.copyText(text);
        expect(platform.copiedTexts[0]).assertEqual(text);
        expect(service.getState().notice).assertEqual('已复制');
        platform.copyErrorCode = 27787277;
        await service.copyText('failure');
        expect(service.getState().notice).assertEqual('复制失败');
        expect(latest(service, 'setData').code).assertEqual(27787277);
        platform.copyErrorCode = -1;
        await service.copyText('retry');
        expect(latest(service, 'setData').kind).assertEqual('success');
        expect(platform.copiedTexts[2]).assertEqual('retry');
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_2100
     * @tc.name      testAppPerformanceAdditional0021
     * @tc.desc      Verify 异常归一化：空异常、非有限错误码与长消息不污染调用记录
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0021', async (): Promise<void> => {
      const platform = new RejectionPlatform();
      await withService(platform, async (service: AppService): Promise<void> => {
        platform.failure = null;
        await service.evictFiles(['entry.hap']);
        expect(latest(service, 'evictFilePages').code).assertEqual(-1);
        expect(latest(service, 'evictFilePages').message).assertEqual('调用失败');
        platform.failure = fixtureError(Number.POSITIVE_INFINITY, ` \n\t${'a'.repeat(200)}\r `);
        await service.evictFiles(['entry.hap']);
        expect(latest(service, 'evictFilePages').code).assertEqual(-1);
        expect(latest(service, 'evictFilePages').message).assertEqual('a'.repeat(160));
        expect(service.getState().memoryBusy).assertFalse();
        expect(platform.pendingTimers()).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_2200
     * @tc.name      testAppPerformanceAdditional0022
     * @tc.desc      Verify 畸形存储字段：无效设置时间及越界记录不会恢复或推进id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0022', async (): Promise<void> => {
      const data = storedFixture();
      data.snapFlag = '启用';
      data.snapAt = 0;
      data.rebuildAt = -1;
      data.nextId = -100;
      const badTarget = storedCall(90);
      badTarget.target = 'x'.repeat(4097);
      const badAt = storedCall(91);
      badAt.at = -1;
      const badElapsed = storedCall(92);
      badElapsed.elapsed = -1;
      const badKind = storedCall(93, 'unsupported-kind');
      const badMessage = storedCall(94);
      badMessage.message = 'x'.repeat(1025);
      data.logs = [badTarget, badAt, badElapsed, badKind, badMessage, storedCall(0)];
      const badGroup = storedLaunch('group');
      badGroup.group = 'not-a-setting';
      const badLaunchAt = storedLaunch('time');
      badLaunchAt.at = -1;
      const badDevice = storedLaunch('device');
      badDevice.device = 'x'.repeat(1025);
      data.launches = [badGroup, badLaunchAt, badDevice, storedLaunch('x'.repeat(161))];
      const store = new MemoryStore();
      store.value = JSON.stringify(data);
      await withService(new FakePlatform(store), (service: AppService): void => {
        expect(service.getState().snapFlag).assertEqual('尚未设置');
        expect(service.getState().snapAt).assertEqual(0);
        expect(service.getState().rebuildAt).assertEqual(0);
        expect(service.getState().logs.length).assertEqual(0);
        expect(service.getState().launches.length).assertEqual(0);
        service.setSnapEnabled(false);
        expect(latest(service, 'setHyperSnapEnabled').id).assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_APPPERFORMANCEADDITIONAL_2300
     * @tc.name      testAppPerformanceAdditional0023
     * @tc.desc      Verify 资源失败恢复：失败的新读取不破坏上一次成功baseline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    scenario('testAppPerformanceAdditional0023', async (): Promise<void> => {
      const platform = new FakePlatform();
      await withService(platform, async (service: AppService): Promise<void> => {
        await service.readResource();
        platform.resourceErrorCode = 13400001;
        platform.resource = new Uint8Array([90]);
        await service.readResource();
        expect(service.getState().notice).assertEqual('读取失败');
        expect(service.getState().resourceBusy).assertFalse();
        platform.resourceErrorCode = -1;
        platform.resource = new Uint8Array([65, 66, 67]);
        await service.verifyResource();
        expect(service.getState().notice).assertEqual('校验一致');
        platform.resource = new Uint8Array([90]);
        await service.verifyResource();
        expect(service.getState().notice).assertEqual('校验不一致');
      });
    });

  });
}
