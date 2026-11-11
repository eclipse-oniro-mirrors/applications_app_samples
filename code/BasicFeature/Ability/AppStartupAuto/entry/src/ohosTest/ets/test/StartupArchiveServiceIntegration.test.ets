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
import { loggedIt as it } from '../support/TestLog';
import { QueryOutcome, QueryPhase, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import {
  ArchiveActionCode, ArchiveDocument, ArchiveStage, ArchivedQuery, ARCHIVE_PENDING_LIMIT
} from '../../../main/ets/autostart/archive/StartupArchive';
import { RevisitStage } from '../../../main/ets/autostart/revisit/RevisitTracker';
import { flushMicrotasks } from '../support/TestSupport';
import { ServiceArchiveIntegrationFixture,
  withServiceArchiveIntegration } from '../support/StartupArchiveServiceIntegrationSupport';

// NativeOnly: actual private RDB, controlled autoStartup API responses, no system setter/clipboard.
export default function startupArchiveServiceIntegrationTests(): void {
  describe('StartupArchiveServiceIntegration', (): void => {
    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0100
     * @tc.name testStartupArchiveServiceIntegration0001
     * @tc.desc 二十五次真实服务查询经pop前采集保留全部归档而live仅二十条并可重开
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0001', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true);
        for (let index = 1; index <= 25; index++) {
          await f.query(index % 2 === 0, index === 1 ? RefreshSource.INITIAL : RefreshSource.MANUAL);
        }
        expect(f.service.records()[0].id).assertEqual(25);
        expect(f.service.records()[19].id).assertEqual(6);
        expect(f.repository.snapshot().rows.length).assertEqual(25);
        const persisted = await f.disk();
        expect(persisted.rows[0].record.result).assertEqual('未开启');
        expect(persisted.rows[24].record.id).assertEqual(25);
        expect(persisted.rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25');
        await f.freshRepository();
        expect(f.repository.snapshot().rows[0].record.source).assertEqual(RefreshSource.INITIAL);
        expect(f.repository.snapshot().automatic).assertTrue();
        expect(f.service.records()[19].id).assertEqual(6);
        expect(f.api.queryCalls).assertEqual(25);
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0200
     * @tc.name testStartupArchiveServiceIntegration0002
     * @tc.desc 清空live不改变真实归档盘面且后续查询只新建一条live记录
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0002', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true);
        await f.query(true, RefreshSource.INITIAL); await f.query(false);
        await f.reject(16000050, 'service-private-detail');
        const before = await f.image(); const current = f.service.snapshot(); f.service.clearRecords();
        expect(f.service.records().length).assertEqual(0);
        expect(f.service.snapshot().phase).assertEqual(current.phase);
        expect(f.service.snapshot().lastValue).assertFalse();
        const after = await f.image();
        expect(after.payload).assertEqual(before.payload);
        expect(after.operation).assertEqual(before.operation);
        await f.query(true);
        expect(f.service.records()[0].id).assertEqual(4);
        expect(f.repository.snapshot().rows[2].record.errorMessage).assertEqual('');
        expect((await f.disk()).rows[3].record.id).assertEqual(4);
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0300
     * @tc.name testStartupArchiveServiceIntegration0003
     * @tc.desc 原生SQL归档失败完整回滚但查询仍成功且明确重试不重复调用原生状态接口
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0003', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.failArchiveWrites();
        await f.query(true, RefreshSource.INITIAL);
        expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
        expect(f.service.records()[0].outcome).assertEqual(QueryOutcome.SUCCESS);
        expect(f.repository.snapshot().paused).assertTrue();
        expect(f.repository.snapshot().pending).assertEqual(1);
        const rolledBack = await f.disk();
        expect(rolledBack.rows.length).assertEqual(0);
        expect(rolledBack.automatic).assertTrue();
        expect(await f.auditCount()).assertEqual(0);
        await f.recoverArchiveWrites(); await f.repository.retryPending();
        expect(f.repository.snapshot().rows[0].record.id).assertEqual(1);
        expect(f.repository.snapshot().pending).assertEqual(0);
        expect(f.api.queryCalls).assertEqual(1);
        const saved = await f.disk();
        expect(saved.rows[0].record.result).assertEqual('已开启');
        expect(saved.nextId).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0400
     * @tc.name testStartupArchiveServiceIntegration0004
     * @tc.desc 归档暂停期间新的原生查询失败仍在live且只能经明确手工补存进入归档
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0004', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.failArchiveWrites();
        await f.query(true); await f.reject(16000050, 'private user@example.com');
        expect(f.service.snapshot().phase).assertEqual(QueryPhase.FAILED);
        expect(f.service.records()[0].errorCode).assertEqual('16000050');
        expect(f.service.records()[0].errorMessage).assertEqual('private user@example.com');
        expect(f.repository.snapshot().pending).assertEqual(1);
        expect(f.repository.snapshot().rejectedCaptures).assertEqual(1);
        await f.recoverArchiveWrites(); await f.repository.retryPending();
        expect(f.repository.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(','))
          .assertEqual('1');
        const manual = await f.repository.save(f.service.records());
        expect(manual.added).assertEqual(1);
        expect(manual.duplicates).assertEqual(1);
        const persisted = await f.disk();
        expect(persisted.rows[1].record.outcome).assertEqual(QueryOutcome.FAILURE);
        expect(persisted.rows[1].record.errorMessage).assertEqual('');
        expect(f.api.queryCalls).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0500
     * @tc.name testStartupArchiveServiceIntegration0005
     * @tc.desc 服务销毁后旧原生结果跨归档重开代次迟到时不能灌入新归档
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0005', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); f.service.refresh(RefreshSource.INITIAL);
        f.service.dispose(); await f.freshRepository(); f.service.onForeground();
        expect(f.api.queryCalls).assertEqual(1);
        f.advance(5); f.api.resolveNext(true); await flushMicrotasks();
        expect(f.api.queryCalls).assertEqual(2);
        expect(f.repository.snapshot().rows.length).assertEqual(0);
        expect(f.service.records().length).assertEqual(0);
        f.advance(9); f.api.resolveNext(false); await flushMicrotasks(); await f.repository.whenIdle();
        expect(f.service.records()[0].id).assertEqual(2);
        expect(f.repository.snapshot().rows[0].record.durationMillis).assertEqual(9);
        const persisted = await f.disk();
        expect(persisted.rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('2');
        expect(persisted.rows[0].record.result).assertEqual('未开启');
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0600
     * @tc.name testStartupArchiveServiceIntegration0006
     * @tc.desc 已落盘超时证据在服务销毁重入和迟到成功后不被改写或追加虚假成功
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0006', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); f.service.refresh(RefreshSource.INITIAL);
        f.advance(5000); await f.repository.whenIdle();
        expect(f.service.records()[0].outcome).assertEqual(QueryOutcome.TIMEOUT);
        f.service.dispose(); await f.freshRepository(); f.service.onForeground();
        f.api.resolveNext(true); await flushMicrotasks();
        expect(f.repository.snapshot().rows[0].record.result).assertEqual('等待超时');
        expect(f.api.queryCalls).assertEqual(2);
        f.advance(12); f.api.resolveNext(false); await flushMicrotasks(); await f.repository.whenIdle();
        expect(f.service.records().map((row): number => row.id).join(',')).assertEqual('2,1');
        const persisted = await f.disk();
        expect(persisted.rows[0].record.durationMillis).assertEqual(5000);
        expect(persisted.rows[1].record.outcome).assertEqual(QueryOutcome.SUCCESS);
        expect(persisted.rows.map((row: ArchivedQuery): string => row.record.result).join(',')).assertEqual('等待超时,未开启');
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0700
     * @tc.name testStartupArchiveServiceIntegration0007
     * @tc.desc 实际查询仍挂起时清空归档不取消查询且完成后使用未复位归档序号保存
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0007', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(true, RefreshSource.INITIAL);
        f.service.refresh(RefreshSource.MANUAL); f.advance(5);
        const cleared = await f.repository.clear(f.repository.snapshot().revision);
        expect(cleared.removed).assertEqual(1);
        expect(f.service.snapshot().phase).assertEqual(QueryPhase.QUERYING);
        expect(f.api.pendingCount()).assertEqual(1);
        f.advance(8); f.api.resolveNext(false); await flushMicrotasks(); await f.repository.whenIdle();
        expect(f.service.records().map((row): number => row.id).join(',')).assertEqual('2,1');
        expect(f.repository.snapshot().rows[0].archiveId).assertEqual(2);
        const persisted = await f.disk();
        expect(persisted.rows[0].record.durationMillis).assertEqual(13);
        expect(persisted.rows[0].record.id).assertEqual(2);
        expect(persisted.nextId).assertEqual(3);
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0800
     * @tc.name testStartupArchiveServiceIntegration0008
     * @tc.desc 两个实际Service会话复用query编号仍保存为两份归档且不回灌旧live
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0008', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(true, RefreshSource.INITIAL);
        const previousService = f.service; await f.freshService(); await f.query(false, RefreshSource.INITIAL);
        expect(f.service.records()[0].id).assertEqual(1);
        expect(f.service.records()[0].result).assertEqual('未开启');
        expect(previousService.records()[0].result).assertEqual('已开启');
        const persisted = await f.disk();
        expect(persisted.rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('1,1');
        expect(persisted.rows.map((row: ArchivedQuery): number => row.archiveId).join(',')).assertEqual('1,2');
        await f.freshRepository();
        expect(f.service.records().length).assertEqual(1);
        expect(f.repository.snapshot().rows[0].record.result).assertEqual('已开启');
        expect(f.api.queryCalls).assertEqual(2);
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_0900
     * @tc.name testStartupArchiveServiceIntegration0009
     * @tc.desc 真实盘面未来schema使归档阻写但查询继续且修复重读后只补存缺失证据
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0009', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(true, RefreshSource.INITIAL);
        const before = await f.image();
        const future = JSON.parse(before.payload) as ArchiveDocument;
        future.schema = 99;
        const invalid = JSON.stringify(future);
        await f.replaceDocument(invalid, before.revision, before.operation, true);
        expect(f.repository.snapshot().stage).assertEqual(ArchiveStage.BLOCKED);
        await f.query(false);
        expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
        expect(f.service.records()[0].result).assertEqual('未开启');
        expect((await f.repository.clear(before.revision)).code).assertEqual(ArchiveActionCode.BLOCKED);
        const preserved = await f.image(true);
        expect(preserved.payload).assertEqual(invalid);
        expect(preserved.revision).assertEqual(before.revision);
        await f.replaceDocument(before.payload, before.revision, before.operation);
        const recovered = await f.repository.save(f.service.records());
        expect(recovered.added).assertEqual(1);
        expect(recovered.duplicates).assertEqual(1);
        expect((await f.disk()).rows[1].record.result).assertEqual('未开启');
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_1000
     * @tc.name testStartupArchiveServiceIntegration0010
     * @tc.desc 真实查询突发形成归档背压后只承认受理证据且未受理live需手工补存
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0010', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); const gate = await f.gateStorage(); gate.hold = true;
        for (let index = 1; index <= 25; index++) {
          await f.query(index % 2 === 0, RefreshSource.MANUAL, false);
        }
        expect(f.service.records()[19].id).assertEqual(6);
        expect(f.repository.snapshot().pending).assertEqual(ARCHIVE_PENDING_LIMIT);
        expect(f.repository.snapshot().paused).assertTrue();
        expect(f.repository.snapshot().rejectedCaptures).assertEqual(5);
        gate.release(); await f.repository.whenIdle();
        const firstCommit = await f.disk();
        expect(firstCommit.rows.map((row: ArchivedQuery): number => row.record.id).join(',')).assertEqual('1');
        expect(f.repository.snapshot().pending).assertEqual(19);
        await f.repository.retryPending();
        expect(f.repository.snapshot().rows.length).assertEqual(20);
        const selectedLive = await f.repository.save(f.service.records());
        expect(selectedLive.added).assertEqual(5);
        expect(selectedLive.duplicates).assertEqual(15);
        expect((await f.disk()).rows.length).assertEqual(25);
        expect(f.api.queryCalls).assertEqual(25);
      });
    });

    /**
     * @tc.number SUB_STARTUP_SERVICEARCHIVE_INTEGRATION_1100
     * @tc.name testStartupArchiveServiceIntegration0011
     * @tc.desc 正式设置回访前后台流程生成的SETTINGS查询与前样本持久归档并保持证据免责声明
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testStartupArchiveServiceIntegration0011', 0, async (): Promise<void> => {
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(false, RefreshSource.INITIAL);
        expect(f.service.beginRevisit()).assertTrue();
        f.service.onBackground(); f.service.onForeground();
        expect(f.api.pendingCount()).assertEqual(1);
        f.advance(11); f.api.resolveNext(true); await flushMicrotasks(); await f.repository.whenIdle();
        const session = f.service.revisitSnapshot();
        expect(session.stage).assertEqual(RevisitStage.RECHECKED);
        expect(session.before?.id).assertEqual(1);
        expect(session.after?.id).assertEqual(2);
        expect(f.service.records()[0].source).assertEqual(RefreshSource.SETTINGS);
        const persisted = await f.disk();
        expect(persisted.rows[0].record.result).assertEqual('未开启');
        expect(persisted.rows[1].record.source).assertEqual(RefreshSource.SETTINGS);
        expect(f.repository.exportText().indexOf('不证明实际开机拉起') >= 0).assertTrue();
        await f.freshRepository();
        expect(f.api.queryCalls).assertEqual(2);
        expect(f.repository.snapshot().rows[1].record.id).assertEqual(2);
      });
    });
  });
}
