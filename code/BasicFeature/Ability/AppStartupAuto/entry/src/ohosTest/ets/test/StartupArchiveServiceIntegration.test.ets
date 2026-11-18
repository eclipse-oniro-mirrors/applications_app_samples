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
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
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
  configureTestText();
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true);
        for (let index = 1; index <= 25; index++) {
          await f.query(index % 2 === 0, index === 1 ? RefreshSource.INITIAL : RefreshSource.MANUAL);
        }
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0001|assertEqual|actual', f.service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0001|assertEqual|expected', 25));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0002|assertEqual|actual', f.service.records()[19].id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0002|assertEqual|expected', 6));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0003|assertEqual|actual', f.repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0003|assertEqual|expected', 25));
        const persisted = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0004|assertEqual|actual', persisted.rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0004|assertEqual|expected', '未开启'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0005|assertEqual|actual', persisted.rows[24].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0005|assertEqual|expected', 25));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0006|assertEqual|actual', persisted.rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0006|assertEqual|expected', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25'));
        await f.freshRepository();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0007|assertEqual|actual', f.repository.snapshot().rows[0].record.source)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0007|assertEqual|expected', RefreshSource.INITIAL));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0008|assertTrue|actual|expected=true', f.repository.snapshot().automatic)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0009|assertEqual|actual', f.service.records()[19].id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0009|assertEqual|expected', 6));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0010|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0001|StartupArchiveServiceIntegration.test.ets|assert0010|assertEqual|expected', 25));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true);
        await f.query(true, RefreshSource.INITIAL); await f.query(false);
        await f.reject(16000050, 'service-private-detail');
        const before = await f.image(); const current = f.service.snapshot(); f.service.clearRecords();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0011|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0011|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0012|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0012|assertEqual|expected', current.phase));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0013|assertFalse|actual|expected=false', f.service.snapshot().lastValue)).assertFalse();
        const after = await f.image();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0014|assertEqual|actual', after.payload)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0014|assertEqual|expected', before.payload));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0015|assertEqual|actual', after.operation)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0015|assertEqual|expected', before.operation));
        await f.query(true);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0016|assertEqual|actual', f.service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0016|assertEqual|expected', 4));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0017|assertEqual|actual', f.repository.snapshot().rows[2].record.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0017|assertEqual|expected', ''));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0018|assertEqual|actual', (await f.disk()).rows[3].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0002|StartupArchiveServiceIntegration.test.ets|assert0018|assertEqual|expected', 4));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.failArchiveWrites();
        await f.query(true, RefreshSource.INITIAL);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0019|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0019|assertEqual|expected', QueryPhase.SUCCEEDED));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0020|assertEqual|actual', f.service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0020|assertEqual|expected', QueryOutcome.SUCCESS));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0021|assertTrue|actual|expected=true', f.repository.snapshot().paused)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0022|assertEqual|actual', f.repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0022|assertEqual|expected', 1));
        const rolledBack = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0023|assertEqual|actual', rolledBack.rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0023|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0024|assertTrue|actual|expected=true', rolledBack.automatic)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0025|assertEqual|actual', await f.auditCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0025|assertEqual|expected', 0));
        await f.recoverArchiveWrites(); await f.repository.retryPending();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0026|assertEqual|actual', f.repository.snapshot().rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0026|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0027|assertEqual|actual', f.repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0027|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0028|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0028|assertEqual|expected', 1));
        const saved = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0029|assertEqual|actual', saved.rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0029|assertEqual|expected', '已开启'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0030|assertEqual|actual', saved.nextId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0003|StartupArchiveServiceIntegration.test.ets|assert0030|assertEqual|expected', 2));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.failArchiveWrites();
        await f.query(true); await f.reject(16000050, 'private user@example.com');
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0031|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0031|assertEqual|expected', QueryPhase.FAILED));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0032|assertEqual|actual', f.service.records()[0].errorCode)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0032|assertEqual|expected', '16000050'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0033|assertEqual|actual', f.service.records()[0].errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0033|assertEqual|expected', 'private user@example.com'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0034|assertEqual|actual', f.repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0034|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0035|assertEqual|actual', f.repository.snapshot().rejectedCaptures)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0035|assertEqual|expected', 1));
        await f.recoverArchiveWrites(); await f.repository.retryPending();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0036|assertEqual|actual', f.repository.snapshot().rows.map((row: ArchivedQuery): number => row.record.id).join(',')))
          .assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0036|assertEqual|expected', '1'));
        const manual = await f.repository.save(f.service.records());
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0037|assertEqual|actual', manual.added)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0037|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0038|assertEqual|actual', manual.duplicates)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0038|assertEqual|expected', 1));
        const persisted = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0039|assertEqual|actual', persisted.rows[1].record.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0039|assertEqual|expected', QueryOutcome.FAILURE));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0040|assertEqual|actual', persisted.rows[1].record.errorMessage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0040|assertEqual|expected', ''));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0041|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0004|StartupArchiveServiceIntegration.test.ets|assert0041|assertEqual|expected', 2));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); f.service.refresh(RefreshSource.INITIAL);
        f.service.dispose(); await f.freshRepository(); f.service.onForeground();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0042|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0042|assertEqual|expected', 1));
        f.advance(5); f.api.resolveNext(true); await flushMicrotasks();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0043|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0043|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0044|assertEqual|actual', f.repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0044|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0045|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0045|assertEqual|expected', 0));
        f.advance(9); f.api.resolveNext(false); await flushMicrotasks(); await f.repository.whenIdle();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0046|assertEqual|actual', f.service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0046|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0047|assertEqual|actual', f.repository.snapshot().rows[0].record.durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0047|assertEqual|expected', 9));
        const persisted = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0048|assertEqual|actual', persisted.rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0048|assertEqual|expected', '2'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0049|assertEqual|actual', persisted.rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0005|StartupArchiveServiceIntegration.test.ets|assert0049|assertEqual|expected', '未开启'));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); f.service.refresh(RefreshSource.INITIAL);
        f.advance(5000); await f.repository.whenIdle();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0050|assertEqual|actual', f.service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0050|assertEqual|expected', QueryOutcome.TIMEOUT));
        f.service.dispose(); await f.freshRepository(); f.service.onForeground();
        f.api.resolveNext(true); await flushMicrotasks();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0051|assertEqual|actual', f.repository.snapshot().rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0051|assertEqual|expected', '等待超时'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0052|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0052|assertEqual|expected', 2));
        f.advance(12); f.api.resolveNext(false); await flushMicrotasks(); await f.repository.whenIdle();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0053|assertEqual|actual', f.service.records().map((row): number => row.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0053|assertEqual|expected', '2,1'));
        const persisted = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0054|assertEqual|actual', persisted.rows[0].record.durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0054|assertEqual|expected', 5000));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0055|assertEqual|actual', persisted.rows[1].record.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0055|assertEqual|expected', QueryOutcome.SUCCESS));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0056|assertEqual|actual', persisted.rows.map((row: ArchivedQuery): string => row.record.result).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0006|StartupArchiveServiceIntegration.test.ets|assert0056|assertEqual|expected', '等待超时,未开启'));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(true, RefreshSource.INITIAL);
        f.service.refresh(RefreshSource.MANUAL); f.advance(5);
        const cleared = await f.repository.clear(f.repository.snapshot().revision);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0057|assertEqual|actual', cleared.removed)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0057|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0058|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0058|assertEqual|expected', QueryPhase.QUERYING));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0059|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0059|assertEqual|expected', 1));
        f.advance(8); f.api.resolveNext(false); await flushMicrotasks(); await f.repository.whenIdle();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0060|assertEqual|actual', f.service.records().map((row): number => row.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0060|assertEqual|expected', '2,1'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0061|assertEqual|actual', f.repository.snapshot().rows[0].archiveId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0061|assertEqual|expected', 2));
        const persisted = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0062|assertEqual|actual', persisted.rows[0].record.durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0062|assertEqual|expected', 13));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0063|assertEqual|actual', persisted.rows[0].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0063|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0064|assertEqual|actual', persisted.nextId)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0007|StartupArchiveServiceIntegration.test.ets|assert0064|assertEqual|expected', 3));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(true, RefreshSource.INITIAL);
        const previousService = f.service; await f.freshService(); await f.query(false, RefreshSource.INITIAL);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0065|assertEqual|actual', f.service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0065|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0066|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0066|assertEqual|expected', '未开启'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0067|assertEqual|actual', previousService.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0067|assertEqual|expected', '已开启'));
        const persisted = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0068|assertEqual|actual', persisted.rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0068|assertEqual|expected', '1,1'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0069|assertEqual|actual', persisted.rows.map((row: ArchivedQuery): number => row.archiveId).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0069|assertEqual|expected', '1,2'));
        await f.freshRepository();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0070|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0070|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0071|assertEqual|actual', f.repository.snapshot().rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0071|assertEqual|expected', '已开启'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0072|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0008|StartupArchiveServiceIntegration.test.ets|assert0072|assertEqual|expected', 2));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(true, RefreshSource.INITIAL);
        const before = await f.image();
        const future = JSON.parse(before.payload) as ArchiveDocument;
        future.schema = 99;
        const invalid = JSON.stringify(future);
        await f.replaceDocument(invalid, before.revision, before.operation, true);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0073|assertEqual|actual', f.repository.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0073|assertEqual|expected', ArchiveStage.BLOCKED));
        await f.query(false);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0074|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0074|assertEqual|expected', QueryPhase.SUCCEEDED));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0075|assertEqual|actual', f.service.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0075|assertEqual|expected', '未开启'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0076|assertEqual|actual', (await f.repository.clear(before.revision)).code)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0076|assertEqual|expected', ArchiveActionCode.BLOCKED));
        const preserved = await f.image(true);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0077|assertEqual|actual', preserved.payload)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0077|assertEqual|expected', invalid));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0078|assertEqual|actual', preserved.revision)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0078|assertEqual|expected', before.revision));
        await f.replaceDocument(before.payload, before.revision, before.operation);
        const recovered = await f.repository.save(f.service.records());
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0079|assertEqual|actual', recovered.added)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0079|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0080|assertEqual|actual', recovered.duplicates)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0080|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0081|assertEqual|actual', (await f.disk()).rows[1].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0009|StartupArchiveServiceIntegration.test.ets|assert0081|assertEqual|expected', '未开启'));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); const gate = await f.gateStorage(); gate.hold = true;
        for (let index = 1; index <= 25; index++) {
          await f.query(index % 2 === 0, RefreshSource.MANUAL, false);
        }
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0082|assertEqual|actual', f.service.records()[19].id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0082|assertEqual|expected', 6));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0083|assertEqual|actual', f.repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0083|assertEqual|expected', ARCHIVE_PENDING_LIMIT));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0084|assertTrue|actual|expected=true', f.repository.snapshot().paused)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0085|assertEqual|actual', f.repository.snapshot().rejectedCaptures)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0085|assertEqual|expected', 5));
        gate.release(); await f.repository.whenIdle();
        const firstCommit = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0086|assertEqual|actual', firstCommit.rows.map((row: ArchivedQuery): number => row.record.id).join(','))).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0086|assertEqual|expected', '1'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0087|assertEqual|actual', f.repository.snapshot().pending)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0087|assertEqual|expected', 19));
        await f.repository.retryPending();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0088|assertEqual|actual', f.repository.snapshot().rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0088|assertEqual|expected', 20));
        const selectedLive = await f.repository.save(f.service.records());
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0089|assertEqual|actual', selectedLive.added)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0089|assertEqual|expected', 5));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0090|assertEqual|actual', selectedLive.duplicates)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0090|assertEqual|expected', 15));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0091|assertEqual|actual', (await f.disk()).rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0091|assertEqual|expected', 25));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0092|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0010|StartupArchiveServiceIntegration.test.ets|assert0092|assertEqual|expected', 25));
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
      configureTestText();
      await withServiceArchiveIntegration(async (f: ServiceArchiveIntegrationFixture): Promise<void> => {
        await f.repository.setAutomatic(true); await f.query(false, RefreshSource.INITIAL);
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0093|assertTrue|actual|expected=true', f.service.beginRevisit())).assertTrue();
        f.service.onBackground(); f.service.onForeground();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0094|assertEqual|actual', f.api.pendingCount())).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0094|assertEqual|expected', 1));
        f.advance(11); f.api.resolveNext(true); await flushMicrotasks(); await f.repository.whenIdle();
        const session = f.service.revisitSnapshot();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0095|assertEqual|actual', session.stage)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0095|assertEqual|expected', RevisitStage.RECHECKED));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0096|assertEqual|actual', session.before?.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0096|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0097|assertEqual|actual', session.after?.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0097|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0098|assertEqual|actual', f.service.records()[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0098|assertEqual|expected', RefreshSource.SETTINGS));
        const persisted = await f.disk();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0099|assertEqual|actual', persisted.rows[0].record.result)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0099|assertEqual|expected', '未开启'));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0100|assertEqual|actual', persisted.rows[1].record.source)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0100|assertEqual|expected', RefreshSource.SETTINGS));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0101|assertTrue|actual|expected=true', f.repository.exportText().indexOf('不证明实际开机拉起') >= 0)).assertTrue();
        await f.freshRepository();
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0102|assertEqual|actual', f.api.queryCalls)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0102|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0103|assertEqual|actual', f.repository.snapshot().rows[1].record.id)).assertEqual(traceParameter('com.samples.appstartupauto_StartupArchiveServiceIntegration_0011|StartupArchiveServiceIntegration.test.ets|assert0103|assertEqual|expected', 2));
      });
    });
  });
}
