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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:120 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:120 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:121 assertEqual actual', platform.fileCalls[0].length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:121 assertEqual expected', 32));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:122 assertEqual actual', platform.fileCalls[0][0].length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:122 assertEqual expected', 255));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:123 assertEqual actual', latest(service, 'evictFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:123 assertEqual expected', 'success'));
        await service.evictFiles([`${'b'.repeat(253)}.so`]);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:125 assertEqual actual', platform.fileCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:125 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:126 assertEqual actual', latest(service, 'evictFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:126 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:127 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0001 Additional.test:127 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:149 assertEqual actual', platform.moduleCalls[0].length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:149 assertEqual expected', 32));
        for (const targets of [[], ['  '], platform.modules]) {
          await service.evictModules(targets);
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:152 assertEqual actual', latest(service, 'evictModuleFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:152 assertEqual expected', 'blocked'));
        }
        platform.moduleAvailable = false;
        await service.evictModules(['module0']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:156 assertEqual actual', latest(service, 'evictModuleFilePages').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:156 assertEqual expected', '请升级系统'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:157 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:157 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0002 Additional.test:158 assertFalse actual', service.getState().memoryBusy)).assertFalse();
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:177 assertEqual actual', service.getState().files.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:177 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:178 assertEqual actual', service.getState().modules.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:178 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:179 assertTrue actual', service.getState().targetMessage.indexOf('可手动输入文件名') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:180 assertEqual actual', latest(service, 'getBundleInfoForSelfSync').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:180 assertEqual expected', 17700001));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:181 assertEqual actual', latest(service, 'listFileSync').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:181 assertEqual expected', 13900012));
        platform.bundleErrorCode = -1;
        platform.listErrorCode = -1;
        platform.files = ['z.hsp', 'nested/a.hap', 'a.hap', 'bad.TXT', 'nested/b.so'];
        platform.modules = ['entry', '', 'entry', 'feature'];
        service.refreshTargets();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:187 assertEqual actual', service.getState().files.join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:187 assertEqual expected', 'a.hap|b.so|z.hsp'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:188 assertEqual actual', service.getState().modules.join('|'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:188 assertEqual expected', 'entry|feature'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:189 assertEqual actual', service.getState().targetMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0003 Additional.test:189 assertEqual expected', '3 个文件 · 2 个模块'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:211 assertEqual actual', service.getState().configStatus)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:211 assertEqual expected', '配置有效'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:212 assertEqual actual', latest(service, 'getRawFileContentSync').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:212 assertEqual expected', '32 项'));
        const invalid = ['null', '{"evictFilePages":[]}', '{"evictFilePages":[1]}',
          '{"evictFilePages":["../entry.hap"]}', JSON.stringify({ evictFilePages: names.concat(['extra.so']) })];
        invalid.forEach((text: string): void => {
          platform.config = text;
          service.checkConfig();
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:218 assertEqual actual', service.getState().configStatus)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:218 assertEqual expected', '配置无效'));
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:219 assertEqual actual', latest(service, 'getRawFileContentSync').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:219 assertEqual expected', 'error'));
        });
        platform.configErrorCode = 13400001;
        service.checkConfig();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:223 assertEqual actual', service.getState().configStatus)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:223 assertEqual expected', '配置读取失败'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:224 assertEqual actual', latest(service, 'getRawFileContentSync').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0004 Additional.test:224 assertEqual expected', 13400001));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:241 assertTrue actual', service.getState().resourceBusy)).assertTrue();
        await service.readResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:243 assertEqual actual', latest(service, 'getRawFileContent').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:243 assertEqual expected', '资源读取中'));
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:245 assertEqual actual', latest(service, 'getRawFileContent').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:245 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:246 assertEqual actual', platform.resourceCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:246 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:247 assertTrue actual', service.getState().resourceBusy)).assertTrue();
        platform.releaseResource(new Uint8Array([65, 66]));
        await pending;
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:250 assertFalse actual', service.getState().resourceBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0005 Additional.test:251 assertTrue actual', service.getState().resourceText.indexOf('2 字节') >= 0)).assertTrue();
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:270 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:270 assertEqual expected', '校验不一致'));
        await service.readResource();
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:273 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:273 assertEqual expected', '校验一致'));
        platform.resource = new Uint8Array(0);
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:276 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:276 assertEqual expected', '校验不一致'));
        await service.readResource();
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:279 assertEqual actual', service.getState().resourceText)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0006 Additional.test:279 assertEqual expected', '校验一致 · 0 字节'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:301 assertEqual actual', byId(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:301 assertEqual expected', 'pending'));
        await service.evictModules(['entry']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:303 assertEqual actual', platform.moduleCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:303 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:304 assertEqual actual', latest(service, 'evictModuleFilePages').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:304 assertEqual expected', '上一调用仍在等待'));
        platform.advance(1);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:306 assertEqual actual', byId(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:306 assertEqual expected', 'timeout'));
        platform.releaseFile();
        await pending;
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:309 assertEqual actual', byId(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:309 assertEqual expected', 'error'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:310 assertEqual actual', byId(service, id).code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:310 assertEqual expected', 16000163));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:311 assertTrue actual', byId(service, id).late)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:312 assertFalse actual', service.getState().memoryBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:313 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0007 Additional.test:313 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:333 assertEqual actual', platform.snapCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:333 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:334 assertEqual actual', platform.rebuildCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:334 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:335 assertEqual actual', service.getState().snapFlag)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:335 assertEqual expected', '尚未设置'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:336 assertEqual actual', service.getState().rebuildWaitSeconds)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:336 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:337 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:337 assertEqual expected', 0));
        platform.rebuildAvailable = true;
        service.rebuildSnap(' \n\t ');
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:340 assertEqual actual', latest(service, 'requestRebuildHyperSnap').target)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:340 assertEqual expected', '手动重建'));
        platform.advance(10000);
        service.rebuildSnap(` \n${'x'.repeat(250)}\t `);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:343 assertEqual actual', latest(service, 'requestRebuildHyperSnap').target)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:343 assertEqual expected', 'x'.repeat(200)));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:344 assertEqual actual', platform.rebuildCalls)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0008 Additional.test:344 assertEqual expected', 2));
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
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:366 assertEqual actual', platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:366 assertEqual expected', 32));
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:367 assertEqual actual', platform.copiedTexts.indexOf('blocked-copy'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:367 assertEqual expected', -1));
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:368 assertEqual actual', latest(service, 'setData').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:368 assertEqual expected', 'blocked'));
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:369 assertEqual actual', latest(service, 'setData').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:369 assertEqual expected', '在途调用过多'));
          platform.finishAll();
          await Promise.all(pending);
          const next = service.copyText('allowed-copy');
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:373 assertEqual actual', platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:373 assertEqual expected', 33));
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:374 assertEqual actual', platform.copiedTexts[32])).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:374 assertEqual expected', 'allowed-copy'));
          platform.resolveAt(32);
          await next;
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:377 assertEqual actual', latest(service, 'setData').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:377 assertEqual expected', 'success'));
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:378 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0009 Additional.test:378 assertEqual expected', '已复制'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:402 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:402 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:403 assertEqual actual', service.getState().logs[0].id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:403 assertEqual expected', id));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:404 assertEqual actual', service.getState().latestMemory?.id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:404 assertEqual expected', id));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:405 assertTrue actual', service.getState().memoryBusy)).assertTrue();
        platform.releaseFile();
        await pending;
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:408 assertEqual actual', byId(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:408 assertEqual expected', 'success'));
        service.clearLogs();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:410 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:410 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:411 assertUndefined actual', service.getState().latestMemory)).assertUndefined();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:412 assertEqual actual', service.getState().snapFlag)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0010 Additional.test:412 assertEqual expected', '启用'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:434 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:434 assertEqual expected', 100));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:435 assertEqual actual', byId(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:435 assertEqual expected', 'pending'));
        platform.advance(23);
        platform.releaseFile();
        await pending;
        const rows = service.getState().logs;
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:440 assertEqual actual', rows.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:440 assertEqual expected', 100));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:441 assertEqual actual', rows.filter((row: CallRecord): boolean => row.id === id).length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:441 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:442 assertEqual actual', byId(service, id).elapsed)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:442 assertEqual expected', 23));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:443 assertEqual actual', byId(service, id).kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0011 Additional.test:443 assertEqual expected', 'success'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:461 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:461 assertEqual expected', '存储读取失败'));
        service.setSnapEnabled(true);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:463 assertEqual actual', service.getState().snapFlag)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:463 assertEqual expected', '启用'));
      });
      const legacy = new MemoryStore();
      legacy.value = '{"schema":1}';
      await withService(new FakePlatform(legacy), (service: AppService): void => {
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:468 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:468 assertEqual expected', '存储数据已重置'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:469 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:469 assertEqual expected', 0));
      });
      const unreadable = new MemoryStore();
      unreadable.readFailure = true;
      await withService(new FakePlatform(unreadable), (service: AppService): void => {
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:474 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:474 assertEqual expected', '存储读取失败'));
      });
      await withService(new MissingStorePlatform(), (service: AppService): void => {
        service.setSnapEnabled(false);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:478 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:478 assertEqual expected', '存储不可用'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:479 assertEqual actual', latest(service, 'setHyperSnapEnabled').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0012 Additional.test:479 assertEqual expected', 'success'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:507 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:507 assertEqual expected', 3));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:508 assertEqual actual', byId(service, 40).status)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:508 assertEqual expected', '进程已结束'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:509 assertEqual actual', byId(service, 39).code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:509 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:510 assertFalse actual', byId(service, 39).late)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:511 assertEqual actual', service.getState().latestMemory?.id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:511 assertEqual expected', 40));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:512 assertEqual actual', service.getState().launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:512 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:513 assertEqual actual', service.getState().launches[0].id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:513 assertEqual expected', 'kept'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:514 assertEqual actual', service.getState().snapFlag)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:514 assertEqual expected', '启用'));
        service.setSnapEnabled(false);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:516 assertEqual actual', latest(service, 'setHyperSnapEnabled').id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0013 Additional.test:516 assertEqual expected', 41));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:537 assertEqual actual', service.getState().launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:537 assertEqual expected', 60));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:538 assertEqual actual', service.getState().launches[59].id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:538 assertEqual expected', 'old-59'));
        service.markContentLoaded();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:540 assertEqual actual', service.getState().launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:540 assertEqual expected', 60));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:541 assertEqual actual', service.getState().launches[1].id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:541 assertEqual expected', 'old-0'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:542 assertEqual actual', service.getState().launches[59].id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:542 assertEqual expected', 'old-58'));
        await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:544 assertEqual actual', (JSON.parse(store.value) as StoredFixture).launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0014 Additional.test:544 assertEqual expected', 60));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:572 assertEqual actual', rows.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:572 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:573 assertEqual actual', rows[0].group)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:573 assertEqual expected', '禁用'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:574 assertEqual actual', rows[0].contentMs)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:574 assertEqual expected', 45));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:575 assertEqual actual', rows[0].at)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:575 assertEqual expected', startedAt));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:576 assertEqual actual', rows[0].device)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:576 assertEqual expected', platform.environmentText));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:577 assertEqual actual', rows[0].appVersion)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:577 assertEqual expected', platform.versionName));
        await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:579 assertEqual actual', (JSON.parse(store.value) as StoredFixture).launches[0].id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0015 Additional.test:579 assertEqual expected', rows[0].id));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:598 assertEqual actual', service.getState().launches[0].appVersion)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:598 assertEqual expected', '读取失败'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:599 assertEqual actual', service.getState().launches[0].contentMs)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:599 assertEqual expected', 5));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:600 assertEqual actual', latest(service, 'getBundleInfoForSelfSync').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:600 assertEqual expected', 17700001));
        const count = service.getState().logs.length;
        service.clearLaunches();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:603 assertEqual actual', service.getState().launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:603 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:604 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:604 assertEqual expected', count));
        await service.whenSaved();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:606 assertEqual actual', (JSON.parse(platform.store.value) as StoredFixture).launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0016 Additional.test:606 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:629 assertEqual actual', store.writeCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:629 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:630 assertFalse actual', saved)).assertFalse();
        store.release(true);
        await flushCoverageMicrotasks();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:633 assertEqual actual', store.writeCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:633 assertEqual expected', 2));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:634 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:634 assertEqual expected', '存储写入失败'));
        for (let index = 2; index <= 4; index++) {
          expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:636 assertEqual actual', store.writeCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:636 assertEqual expected', index));
          store.release();
          await flushCoverageMicrotasks();
        }
        await completed;
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:641 assertTrue actual', saved)).assertTrue();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:642 assertEqual actual', store.writeCalls.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:642 assertEqual expected', 4));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:643 assertEqual actual', service.getState().storageMessage)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:643 assertEqual expected', ''));
        const finalState = JSON.parse(store.value) as StoredFixture;
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:645 assertEqual actual', finalState.snapFlag)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:645 assertEqual expected', '禁用'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:646 assertEqual actual', finalState.logs[0].kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:646 assertEqual expected', 'success'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:647 assertEqual actual', finalState.logs[0].target)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0017 Additional.test:647 assertEqual expected', '禁用'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:674 assertEqual actual', unchanged.files.indexOf('modified.so'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:674 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:675 assertEqual actual', unchanged.modules.indexOf('injected'))).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:675 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:676 assertFalse actual', unchanged.logs[0].message === 'modified')).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:677 assertEqual actual', unchanged.launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:677 assertEqual expected', 1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:678 assertEqual actual', unchanged.launches[0].device)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0018 Additional.test:678 assertEqual expected', platform.environmentText));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:702 assertEqual actual', notices)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:702 assertEqual expected', firstCount));
        const pending = service.evictFiles(['entry.hap']);
        service.rebuildSnap('dispose-test');
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:705 assertEqual actual', latest(service, 'requestRebuildHyperSnap').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:705 assertEqual expected', 'success'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:706 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:706 assertEqual expected', 2));
        service.dispose();
        service.dispose();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:709 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:709 assertEqual expected', 0));
        const disposedCount = notices;
        platform.advance(20000);
        platform.releaseFile();
        await pending;
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:714 assertEqual actual', notices)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:714 assertEqual expected', disposedCount));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:715 assertFalse actual', service.getState().memoryBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:716 assertEqual actual', latest(service, 'evictFilePages').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0019 Additional.test:716 assertEqual expected', 'success'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:737 assertEqual actual', platform.copiedTexts[0])).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:737 assertEqual expected', text));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:738 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:738 assertEqual expected', '已复制'));
        platform.copyErrorCode = 27787277;
        await service.copyText('failure');
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:741 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:741 assertEqual expected', '复制失败'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:742 assertEqual actual', latest(service, 'setData').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:742 assertEqual expected', 27787277));
        platform.copyErrorCode = -1;
        await service.copyText('retry');
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:745 assertEqual actual', latest(service, 'setData').kind)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:745 assertEqual expected', 'success'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:746 assertEqual actual', platform.copiedTexts[2])).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0020 Additional.test:746 assertEqual expected', 'retry'));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:764 assertEqual actual', latest(service, 'evictFilePages').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:764 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:765 assertEqual actual', latest(service, 'evictFilePages').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:765 assertEqual expected', '调用失败'));
        platform.failure = fixtureError(Number.POSITIVE_INFINITY, ` \n\t${'a'.repeat(200)}\r `);
        await service.evictFiles(['entry.hap']);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:768 assertEqual actual', latest(service, 'evictFilePages').code)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:768 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:769 assertEqual actual', latest(service, 'evictFilePages').message)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:769 assertEqual expected', 'a'.repeat(160)));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:770 assertFalse actual', service.getState().memoryBusy)).assertFalse();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:771 assertEqual actual', platform.pendingTimers())).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0021 Additional.test:771 assertEqual expected', 0));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:810 assertEqual actual', service.getState().snapFlag)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:810 assertEqual expected', '尚未设置'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:811 assertEqual actual', service.getState().snapAt)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:811 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:812 assertEqual actual', service.getState().rebuildAt)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:812 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:813 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:813 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:814 assertEqual actual', service.getState().launches.length)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:814 assertEqual expected', 0));
        service.setSnapEnabled(false);
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:816 assertEqual actual', latest(service, 'setHyperSnapEnabled').id)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0022 Additional.test:816 assertEqual expected', 1));
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
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0023 Additional.test:836 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0023 Additional.test:836 assertEqual expected', '读取失败'));
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0023 Additional.test:837 assertFalse actual', service.getState().resourceBusy)).assertFalse();
        platform.resourceErrorCode = -1;
        platform.resource = new Uint8Array([65, 66, 67]);
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0023 Additional.test:841 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0023 Additional.test:841 assertEqual expected', '校验一致'));
        platform.resource = new Uint8Array([90]);
        await service.verifyResource();
        expect(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0023 Additional.test:844 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_AppPerformanceAdditional_0023 Additional.test:844 assertEqual expected', '校验不一致'));
      });
    });

  });
}
