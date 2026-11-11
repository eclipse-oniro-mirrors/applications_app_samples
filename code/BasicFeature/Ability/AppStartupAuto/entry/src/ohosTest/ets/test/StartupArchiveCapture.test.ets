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

import { afterEach, describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import {
  ArchiveActionCode, ArchiveStage, ARCHIVE_MAX_ENTRIES, ARCHIVE_PENDING_LIMIT
} from '../../../main/ets/autostart/archive/StartupArchive';
import { QueryOutcome, QueryPhase, QueryRecord, QueryRecordSink,
  RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { ArchiveMemoryStorage, StartupArchiveFixture, archiveSample } from '../support/StartupArchiveSupport';
import { TestBusinessError, flushMicrotasks } from '../support/TestSupport';

class ThrowingArchiveSink implements QueryRecordSink {
  public calls: number = 0;
  capture(_record: QueryRecord): void {
    this.calls++;
    throw new Error('controlled sink failure');
  }
}

export default function startupArchiveCaptureTests(): void {
  describe('StartupArchiveCapture', (): void => {
    const fixtures: StartupArchiveFixture[] = [];
    const create = async (): Promise<StartupArchiveFixture> => {
      const fixture = new StartupArchiveFixture(); fixtures.push(fixture);
      await fixture.open(); fixture.service.attachRecordSink(fixture.repository); return fixture;
    };
    afterEach(async (): Promise<void> => {
      fixtures.forEach((fixture: StartupArchiveFixture): void => {
        fixture.store.release();
      });
      for (const fixture of fixtures) {
        await fixture.dispose();
      }
      fixtures.splice(0, fixtures.length);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0100
     * @tc.name testStartupArchiveCaptureWaveThree0001
     * @tc.desc 默认关闭自动保存时真实查询仍仅保留live环且不写归档
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0001', 0, async (): Promise<void> => {
      const f = await create();
      for (let index = 0; index < 21; index++) {
        await f.sample(true);
      }
      expect(f.service.records()[0].id).assertEqual(21);
      expect(f.service.records()[19].id).assertEqual(2);
      expect(f.repository.snapshot().rows.length).assertEqual(0);
      expect(f.store.writes).assertEqual(0);
      expect(f.repository.snapshot().automatic).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0200
     * @tc.name testStartupArchiveCaptureWaveThree0002
     * @tc.desc 显式启用并保存当前范围后后续正式查询在live裁剪前归档
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0002', 0, async (): Promise<void> => {
      const f = await create(); await f.sample(false); await f.sample(true);
      await f.repository.setAutomatic(true, f.service.records());
      for (let index = 0; index < 21; index++) {
        await f.sample(index % 2 === 0);
      }
      expect(f.repository.snapshot().rows.length).assertEqual(23);
      expect(f.service.records()[19].id).assertEqual(4);
      expect(f.repository.snapshot().rows.some((row): boolean => row.record.id === 1)).assertTrue();
      expect(f.store.data.value.automatic).assertTrue();
      expect(f.repository.snapshot().pending).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0300
     * @tc.name testStartupArchiveCaptureWaveThree0003
     * @tc.desc 实际能力不支持终态也归档且不伪造状态接口调用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0003', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true); f.api.supported = false;
      f.service.refresh(RefreshSource.INITIAL); await f.repository.whenIdle();
      const record = f.repository.snapshot().rows[0].record;
      expect(record.outcome).assertEqual(QueryOutcome.UNSUPPORTED);
      expect(record.statusResult).assertEqual('未调用');
      expect(f.api.queryCalls).assertEqual(0);
      expect(record.source).assertEqual(RefreshSource.INITIAL);
      expect(f.service.records()[0].id).assertEqual(record.id);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0400
     * @tc.name testStartupArchiveCaptureWaveThree0004
     * @tc.desc 原生失败证据保留真实错误码和耗时而长期归档不存原始错误说明
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0004', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true);
      f.service.refresh(RefreshSource.MANUAL); f.clock.advance(31);
      f.api.rejectNext(new TestBusinessError(16000050, 'private user@example.com'));
      await flushMicrotasks(); await f.repository.whenIdle();
      const record = f.repository.snapshot().rows[0].record;
      expect(record.errorCode).assertEqual('16000050');
      expect(record.durationMillis).assertEqual(31);
      expect(record.errorMessage).assertEqual('');
      expect(f.service.records()[0].errorMessage).assertEqual('private user@example.com');
      expect(record.outcome).assertEqual(QueryOutcome.FAILURE);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0500
     * @tc.name testStartupArchiveCaptureWaveThree0005
     * @tc.desc 超时归档后迟到原生成功不能再保存一条新成功证据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0005', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true);
      f.service.refresh(RefreshSource.MANUAL); f.clock.advance(5000); await f.repository.whenIdle();
      const writes = f.store.writes; f.api.resolveNext(true); await flushMicrotasks(); await f.repository.whenIdle();
      expect(f.repository.snapshot().rows[0].record.outcome).assertEqual(QueryOutcome.TIMEOUT);
      expect(f.repository.snapshot().rows[0].record.durationMillis).assertEqual(5000);
      expect(f.repository.snapshot().rows.length).assertEqual(1);
      expect(f.store.writes).assertEqual(writes);
      expect(f.service.snapshot().pending).assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0600
     * @tc.name testStartupArchiveCaptureWaveThree0006
     * @tc.desc 记录接收端异常不能改变实际查询成功或阻止live保存
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0006', 0, async (): Promise<void> => {
      const f = await create(); const sink = new ThrowingArchiveSink(); f.service.attachRecordSink(sink);
      await f.sample(true);
      expect(f.service.snapshot().phase).assertEqual(QueryPhase.SUCCEEDED);
      expect(f.service.records()[0].result).assertEqual('已开启');
      expect(sink.calls).assertEqual(1);
      expect(f.service.historyNotice().indexOf('归档采集失败') >= 0).assertTrue();
      expect(f.api.queryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0700
     * @tc.name testStartupArchiveCaptureWaveThree0007
     * @tc.desc 采集后调用方修改记录不改变排队等待写入的真实证据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0007', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true); f.store.holdWrites = true;
      const row = archiveSample(8, f.clock.now()); row.errorMessage = 'raw error';
      f.repository.capture(row); row.result = 'changed'; row.errorCode = 'changed';
      await flushMicrotasks(); expect(f.repository.snapshot().pending).assertEqual(1);
      f.store.release(); await f.repository.whenIdle();
      expect(f.repository.snapshot().rows[0].record.result).assertEqual('已开启');
      expect(f.repository.snapshot().rows[0].record.errorCode).assertEqual('');
      expect(f.store.data.value.rows[0].record.errorMessage).assertEqual('');
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0800
     * @tc.name testStartupArchiveCaptureWaveThree0008
     * @tc.desc 已在写入中的重复证据不占第二个待保存名额或额外事务
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0008', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true); f.store.holdWrites = true;
      const row = archiveSample(1, f.clock.now()); f.repository.capture(row); await flushMicrotasks();
      f.repository.capture(row.clone());
      expect(f.repository.snapshot().pending).assertEqual(1);
      expect(f.repository.snapshot().rejectedCaptures).assertEqual(0);
      f.store.release(); await f.repository.whenIdle();
      expect(f.repository.snapshot().rows.length).assertEqual(1);
      expect(f.store.writes).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_0900
     * @tc.name testStartupArchiveCaptureWaveThree0009
     * @tc.desc 队列达到二十条后明确暂停且只有显式重试才继续保存
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0009', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true); f.store.holdWrites = true;
      for (let index = 1; index <= ARCHIVE_PENDING_LIMIT + 1; index++) {
        f.repository.capture(archiveSample(index, f.clock.now() + index));
      }
      expect(f.repository.snapshot().pending).assertEqual(ARCHIVE_PENDING_LIMIT);
      expect(f.repository.snapshot().paused).assertTrue();
      expect(f.repository.snapshot().rejectedCaptures).assertEqual(1);
      await flushMicrotasks(); f.store.release(); await f.repository.whenIdle();
      expect(f.repository.snapshot().paused).assertTrue();
      await f.repository.retryPending();
      expect(f.repository.snapshot().rows.length).assertEqual(ARCHIVE_PENDING_LIMIT);
      expect(f.repository.snapshot().rows.some((row): boolean => row.record.id === ARCHIVE_PENDING_LIMIT + 1))
        .assertFalse();
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1000
     * @tc.name testStartupArchiveCaptureWaveThree0010
     * @tc.desc 启用事务等待期间队列溢出不能被设置成功悄悄恢复自动采集
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0010', 0, async (): Promise<void> => {
      const f = await create(); f.store.holdWrites = true;
      const enabling = f.repository.setAutomatic(true);
      for (let index = 1; index <= ARCHIVE_PENDING_LIMIT + 1; index++) {
        f.repository.capture(archiveSample(index, f.clock.now() + index));
      }
      await flushMicrotasks(); f.store.release(); await enabling; await f.repository.whenIdle();
      expect(f.repository.snapshot().automatic).assertTrue();
      expect(f.repository.snapshot().paused).assertTrue();
      expect(f.repository.snapshot().pending).assertEqual(ARCHIVE_PENDING_LIMIT);
      expect(f.store.writes).assertEqual(1);
      await f.repository.retryPending();
      expect(f.repository.snapshot().rows.length).assertEqual(ARCHIVE_PENDING_LIMIT);
      expect(f.repository.snapshot().pending).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1100
     * @tc.name testStartupArchiveCaptureWaveThree0011
     * @tc.desc 自动写入失败保留待保存项且修复存储后可明确重试
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0011', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true); f.store.failBefore = true;
      f.repository.capture(archiveSample(1, f.clock.now())); await f.repository.whenIdle();
      expect(f.repository.snapshot().pending).assertEqual(1);
      expect(f.repository.snapshot().rows.length).assertEqual(0);
      expect(f.repository.snapshot().paused).assertTrue();
      f.store.failBefore = false; await f.repository.retryPending();
      expect(f.store.data.value.rows[0].record.id).assertEqual(1);
      expect(f.repository.snapshot().pending).assertEqual(0);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1200
     * @tc.name testStartupArchiveCaptureWaveThree0012
     * @tc.desc 自动提交结果不明时重读已落盘项并去重消耗原待保存队列
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0012', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true);
      f.store.failAfter = true; f.store.failConfirmation = true;
      f.repository.capture(archiveSample(1, f.clock.now())); await f.repository.whenIdle();
      expect(f.repository.snapshot().stage).assertEqual(ArchiveStage.BLOCKED);
      expect(f.repository.snapshot().pending).assertEqual(1);
      f.store.failRead = false; f.store.failAfter = false; await f.repository.retryPending();
      expect(f.repository.snapshot().rows[0].archiveId).assertEqual(1);
      expect(f.repository.snapshot().pending).assertEqual(0);
      expect(f.store.writes).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1300
     * @tc.name testStartupArchiveCaptureWaveThree0013
     * @tc.desc 停用设置尚在写入时立即停止本会话新采集而不删旧证据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0013', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.save([archiveSample(1, f.clock.now())]);
      await f.repository.setAutomatic(true); f.store.holdWrites = true;
      const stopping = f.repository.setAutomatic(false);
      f.repository.capture(archiveSample(2, f.clock.now() + 1)); await flushMicrotasks();
      f.store.release(); await stopping;
      expect(f.repository.snapshot().automatic).assertFalse();
      expect(f.repository.snapshot().pending).assertEqual(0);
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(1);
      expect(f.store.writes).assertEqual(3);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1400
     * @tc.name testStartupArchiveCaptureWaveThree0014
     * @tc.desc 关闭后同库新连接可读已提交项并保留待确认队列而异库不能接收
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0014', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true); f.store.failBefore = true;
      f.repository.capture(archiveSample(1, f.clock.now())); await f.repository.whenIdle(); await f.repository.close();
      const reopened = new ArchiveMemoryStorage(f.store.data);
      expect(await f.repository.attach(reopened)).assertTrue();
      expect(f.repository.snapshot().stage).assertEqual(ArchiveStage.READY);
      expect(f.repository.snapshot().paused).assertTrue();
      expect(f.repository.snapshot().pending).assertEqual(1);
      const foreign = new ArchiveMemoryStorage();
      expect(await f.repository.attach(foreign)).assertFalse(); await foreign.close();
      await f.repository.retryPending();
      expect(reopened.data.value.rows[0].record.id).assertEqual(1);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1500
     * @tc.name testStartupArchiveCaptureWaveThree0015
     * @tc.desc 关闭后的真实连接工厂首次失败仍允许用户再次重连读取
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0015', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.save([archiveSample(9, f.clock.now())]);
      await f.repository.close(); let attempts = 0;
      f.repository.setConnector(async (): Promise<ArchiveMemoryStorage> => {
        attempts++;
        if (attempts === 1) {
          throw new Error('connection temporarily unavailable');
        }
        return new ArchiveMemoryStorage(f.store.data);
      });
      expect(await f.repository.reload()).assertFalse();
      expect(f.repository.snapshot().stage).assertEqual(ArchiveStage.BLOCKED);
      expect(await f.repository.reload()).assertTrue();
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(9);
      expect(attempts).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1600
     * @tc.name testStartupArchiveCaptureWaveThree0016
     * @tc.desc 归档观察者异常或退订不能打断真实提交
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0016', 0, async (): Promise<void> => {
      const f = await create(); const states: ArchiveStage[] = [];
      const bad = f.repository.subscribe((): void => {
        throw new Error('observer failed');
      });
      const off = f.repository.subscribe((): void => {
        states.push(f.repository.snapshot().stage);
      });
      await f.repository.save([archiveSample(1, f.clock.now())]);
      expect(states.indexOf(ArchiveStage.WRITING) >= 0).assertTrue();
      expect(states.indexOf(ArchiveStage.READY) >= 0).assertTrue();
      off(); off(); bad(); const calls = states.length;
      await f.repository.save([archiveSample(2, f.clock.now() + 1)]);
      expect(states.length).assertEqual(calls);
      expect(f.store.data.value.rows[1].record.id).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1700
     * @tc.name testStartupArchiveCaptureWaveThree0017
     * @tc.desc 已保存容量满时自动采集暂停且清空确认后可重试保留待保存项
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0017', 0, async (): Promise<void> => {
      const f = await create(); const records: QueryRecord[] = [];
      for (let index = 1; index <= ARCHIVE_MAX_ENTRIES; index++) {
        records.push(archiveSample(index, f.clock.now() - index));
      }
      await f.repository.save(records); await f.repository.setAutomatic(true);
      f.repository.capture(archiveSample(999, f.clock.now())); await f.repository.whenIdle();
      expect(f.repository.snapshot().paused).assertTrue();
      expect(f.repository.snapshot().pending).assertEqual(1);
      expect(f.store.data.value.rows[ARCHIVE_MAX_ENTRIES - 1].record.id).assertEqual(ARCHIVE_MAX_ENTRIES);
      await f.repository.clear(f.repository.snapshot().revision); await f.repository.retryPending();
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(999);
      expect(f.repository.snapshot().rows[0].archiveId).assertEqual(ARCHIVE_MAX_ENTRIES + 1);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1800
     * @tc.name testStartupArchiveCaptureWaveThree0018
     * @tc.desc 页面销毁后的迟到原生结果不制造归档而重入后新查询正常采集
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0018', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true);
      f.service.refresh(RefreshSource.INITIAL); f.service.dispose(); f.api.resolveNext(true);
      await flushMicrotasks(); await f.repository.whenIdle();
      expect(f.repository.snapshot().rows.length).assertEqual(0);
      expect(f.clock.pendingCount()).assertEqual(0);
      f.service.onForeground(); f.api.resolveNext(false); await flushMicrotasks(); await f.repository.whenIdle();
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(2);
      expect(f.repository.snapshot().rows[0].record.result).assertEqual('未开启');
      expect(f.api.queryCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_STARTUP_ARCHIVECAPTURE_1900
     * @tc.name testStartupArchiveCaptureWaveThree0019
     * @tc.desc 清空live不删除已保存归档且之后查询继续使用新的原query编号
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartupArchiveCaptureWaveThree0019', 0, async (): Promise<void> => {
      const f = await create(); await f.repository.setAutomatic(true); await f.sample(true);
      f.service.clearRecords();
      expect(f.service.records().length).assertEqual(0);
      expect(f.repository.snapshot().rows[0].record.id).assertEqual(1);
      await f.sample(false);
      expect(f.repository.view().rows[0].record.id).assertEqual(2);
      expect(f.repository.view().rows[0].archiveId).assertEqual(2);
      expect(f.repository.snapshot().automatic).assertTrue();
    });
  });
}
