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

import { afterEach, beforeEach, describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import { BusinessError } from '@kit.BasicServicesKit';
import { HistoryStorage } from '../../../main/ets/autostart/AutoStartupHistory';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import {
  QueryOutcome, QueryPhase, QueryRecord, QuerySnapshot, RefreshSource
} from '../../../main/ets/autostart/AutoStartupTypes';
import {
  AutoStartupFixture, flushMicrotasks, ManualQueryClock
} from '../support/TestSupport';

class MemoryHistoryStorage implements HistoryStorage {
  public value: string = '';
  public readCount: number = 0;
  public writeCount: number = 0;
  public failRead: boolean = false;
  public failWrite: boolean = false;

  read(): string {
    this.readCount++;
    if (this.failRead) {
      throw new Error('模拟历史读取失败');
    }
    return this.value;
  }

  async write(value: string): Promise<void> {
    this.writeCount++;
    if (this.failWrite) {
      throw new Error('模拟历史写入失败');
    }
    this.value = value;
  }
}

class HistoryFixture {
  public readonly api = new AutoStartupFixture().api;
  public readonly clock: ManualQueryClock = new ManualQueryClock();
  public readonly storage: MemoryHistoryStorage = new MemoryHistoryStorage();
  public readonly service: AutoStartupService;

  constructor() {
    this.service = new AutoStartupService(this.api, this.clock, this.storage);
  }
}

function record(id: number, timestamp: number, result: string, outcome: QueryOutcome,
  message: string = ''): QueryRecord {
  const value = new QueryRecord();
  value.id = id;
  value.timestamp = timestamp;
  value.source = RefreshSource.MANUAL;
  value.result = result;
  value.supportResult = 'true';
  value.statusResult = result;
  value.errorCode = outcome === QueryOutcome.FAILURE ? '16000050' : '';
  value.errorMessage = message;
  value.durationMillis = 12;
  value.outcome = outcome;
  return value;
}

function stored(records: QueryRecord[]): string {
  return JSON.stringify({ schema: 1, savedAt: 1700000000000, records: records });
}

export default function historyCoverageTest(): void {
  configureTestText();
  describe('AutoStartupHistoryCoverage', () => {
    let fixture: HistoryFixture = new HistoryFixture();

    beforeEach(() => {
      configureTestText();
      fixture = new HistoryFixture();
    });

    afterEach(async (): Promise<void> => {
      fixture.service.dispose();
      fixture.clock.clearAll();
      fixture.api.finishPending();
      await flushMicrotasks();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0100
     * @tc.name      testAutoStartupHistoryCoverage0001
     * @tc.desc      Verify completed query persists and restores outcome
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0001', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(25);
      f.api.resolveNext(false);
      await flushMicrotasks();
      await f.service.whenSaved();

      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0001|assertEqual|actual', f.storage.writeCount)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0001|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0002|assertTrue|actual|expected=true', f.storage.value.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0003|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0003|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0004|assertEqual|actual', f.service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0004|assertEqual|expected', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0005|assertEqual|actual', f.service.records('成功').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0005|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0006|assertEqual|actual', f.service.records('失败').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0006|assertEqual|expected', 0));

      const restored = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        const snapshot: QuerySnapshot = restored.snapshot();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0007|assertEqual|actual', snapshot.phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0007|assertEqual|expected', QueryPhase.IDLE));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0008|assertEqual|actual', restored.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0008|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0009|assertEqual|actual', restored.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0009|assertEqual|expected', '未开启'));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0010|assertEqual|actual', restored.records()[0].durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0010|assertEqual|expected', 25));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0011|assertEqual|actual', restored.historyNotice())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0011|assertEqual|expected', ''));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0012|assertEqual|actual', restored.records('成功').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0001|HistoryCoverage.test.ets|assert0012|assertEqual|expected', 1));
      } finally {
        restored.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0200
     * @tc.name      testAutoStartupHistoryCoverage0002
     * @tc.desc      Verify corrupt storage is reported and next write recovers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0002', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.storage.value = '{not json';
      const recovered = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0013|assertEqual|actual', recovered.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0013|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0014|assertTrue|actual|expected=true', recovered.historyNotice().indexOf('损坏') >= 0)).assertTrue();
        recovered.refresh(RefreshSource.MANUAL);
        f.clock.advance(10);
        f.api.resolveNext(true);
        await flushMicrotasks();
        await recovered.whenSaved();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0015|assertEqual|actual', recovered.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0015|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0016|assertEqual|actual', recovered.historyNotice())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0016|assertEqual|expected', ''));
      } finally {
        recovered.dispose();
      }
      const reopened = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0017|assertEqual|actual', reopened.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0017|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0018|assertEqual|actual', reopened.historyNotice())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0002|HistoryCoverage.test.ets|assert0018|assertEqual|expected', ''));
      } finally {
        reopened.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0300
     * @tc.name      testAutoStartupHistoryCoverage0003
     * @tc.desc      Verify write failure keeps business result and can recover
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0003', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.storage.failWrite = true;
      f.service.refresh(RefreshSource.INITIAL);
      f.clock.advance(9);
      f.api.resolveNext(true);
      await flushMicrotasks();
      await f.service.whenSaved();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0019|assertEqual|actual', f.service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0019|assertEqual|expected', 'SUCCEEDED'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0020|assertEqual|actual', f.service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0020|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0021|assertTrue|actual|expected=true', f.service.historyNotice().indexOf('保存失败') >= 0)).assertTrue();

      f.storage.failWrite = false;
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(7);
      f.api.resolveNext(false);
      await flushMicrotasks();
      await f.service.whenSaved();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0022|assertEqual|actual', f.service.historyNotice())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0022|assertEqual|expected', ''));
      const reopened = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0023|assertEqual|actual', reopened.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0023|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0024|assertEqual|actual', reopened.records()[0].result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0003|HistoryCoverage.test.ets|assert0024|assertEqual|expected', '未开启'));
      } finally {
        reopened.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0400
     * @tc.name      testAutoStartupHistoryCoverage0004
     * @tc.desc      Verify read failure starts empty without blocking query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0004', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      f.storage.failRead = true;
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0004|HistoryCoverage.test.ets|assert0025|assertTrue|actual|expected=true', service.historyNotice().indexOf('读取失败') >= 0)).assertTrue();
        service.refresh(RefreshSource.INITIAL);
        f.clock.advance(5);
        f.api.resolveNext(true);
        await flushMicrotasks();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0004|HistoryCoverage.test.ets|assert0026|assertEqual|actual', service.snapshot().phase)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0004|HistoryCoverage.test.ets|assert0026|assertEqual|expected', 'SUCCEEDED'));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0004|HistoryCoverage.test.ets|assert0027|assertEqual|actual', service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0004|HistoryCoverage.test.ets|assert0027|assertEqual|expected', 1));
        await service.whenSaved();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0500
     * @tc.name      testAutoStartupHistoryCoverage0005
     * @tc.desc      Verify expired and duplicate records are dropped on restore
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0005', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const now = f.clock.now();
      f.storage.value = stored([
        record(1, now - 31 * 24 * 60 * 60 * 1000, '已开启', QueryOutcome.SUCCESS),
        record(2, now - 1000, '未开启', QueryOutcome.SUCCESS),
        record(2, now - 500, '已开启', QueryOutcome.SUCCESS)
      ]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0005|HistoryCoverage.test.ets|assert0028|assertEqual|actual', service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0005|HistoryCoverage.test.ets|assert0028|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0005|HistoryCoverage.test.ets|assert0029|assertEqual|actual', service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0005|HistoryCoverage.test.ets|assert0029|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0005|HistoryCoverage.test.ets|assert0030|assertTrue|actual|expected=true', service.historyNotice().indexOf('30 天') >= 0)).assertTrue();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0600
     * @tc.name      testAutoStartupHistoryCoverage0006
     * @tc.desc      Verify restore caps at twenty newest records
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0006', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const now = f.clock.now();
      const values: QueryRecord[] = [];
      for (let index = 0; index < 25; index++) {
        values.push(record(index + 1, now - index * 1000, index % 2 === 0 ? '已开启' : '未开启',
          QueryOutcome.SUCCESS));
      }
      f.storage.value = stored(values);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0006|HistoryCoverage.test.ets|assert0031|assertEqual|actual', service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0006|HistoryCoverage.test.ets|assert0031|assertEqual|expected', 20));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0006|HistoryCoverage.test.ets|assert0032|assertEqual|actual', service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0006|HistoryCoverage.test.ets|assert0032|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0006|HistoryCoverage.test.ets|assert0033|assertEqual|actual', service.records()[19].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0006|HistoryCoverage.test.ets|assert0033|assertEqual|expected', 20));
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0700
     * @tc.name      testAutoStartupHistoryCoverage0007
     * @tc.desc      Verify filter and redacted export hide personal numbers
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0007', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const now = f.clock.now();
      f.storage.value = stored([
        record(1, now - 1000, '查询失败', QueryOutcome.FAILURE, 'account 13800138000 mail a@b.com'),
        record(2, now - 2000, '设备不支持', QueryOutcome.UNSUPPORTED)
      ]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0034|assertEqual|actual', service.records('全部').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0034|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0035|assertEqual|actual', service.records('失败').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0035|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0036|assertEqual|actual', service.records('不支持').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0036|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0037|assertEqual|actual', service.records('成功').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0037|assertEqual|expected', 0));
        const text: string = service.exportHistory();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0038|assertEqual|actual', text.indexOf('13800138000'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0038|assertEqual|expected', -1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0039|assertEqual|actual', text.indexOf('a@b.com'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0039|assertEqual|expected', -1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0040|assertTrue|actual|expected=true', text.indexOf('[号码]') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0041|assertTrue|actual|expected=true', text.indexOf('[邮箱]') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0007|HistoryCoverage.test.ets|assert0042|assertTrue|actual|expected=true', text.indexOf('脱敏导出') >= 0)).assertTrue();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0800
     * @tc.name      testAutoStartupHistoryCoverage0008
     * @tc.desc      Verify legacy array migrates and clear persists empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0008', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const now = f.clock.now();
      const legacy = record(7, now - 1000, '已开启', QueryOutcome.SUCCESS);
      const bag = JSON.parse(JSON.stringify(legacy)) as Record<string, Object>;
      bag['outcome'] = '';
      f.storage.value = JSON.stringify([bag]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0043|assertEqual|actual', service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0043|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0044|assertEqual|actual', service.records()[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0044|assertEqual|expected', QueryOutcome.SUCCESS));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0045|assertTrue|actual|expected=true', service.historyNotice().indexOf('迁移') >= 0)).assertTrue();
        service.clearRecords();
        await service.whenSaved();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0046|assertEqual|actual', service.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0046|assertEqual|expected', 0));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0008|HistoryCoverage.test.ets|assert0047|assertTrue|actual|expected=true', f.storage.value.indexOf('"records":[]') >= 0)).assertTrue();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_0900
     * @tc.name      testAutoStartupHistoryCoverage0009
     * @tc.desc      Verify restored ids continue above maximum without duplicates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0009', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const now = f.clock.now();
      f.storage.value = stored([record(500, now - 1000, '已开启', QueryOutcome.SUCCESS)]);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0009|HistoryCoverage.test.ets|assert0048|assertEqual|actual', service.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0009|HistoryCoverage.test.ets|assert0048|assertEqual|expected', 500));
        service.refresh(RefreshSource.MANUAL);
        f.clock.advance(5);
        f.api.resolveNext(true);
        await flushMicrotasks();
        await service.whenSaved();
        const rows = service.records();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0009|HistoryCoverage.test.ets|assert0049|assertEqual|actual', rows.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0009|HistoryCoverage.test.ets|assert0049|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0009|HistoryCoverage.test.ets|assert0050|assertEqual|actual', rows[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0009|HistoryCoverage.test.ets|assert0050|assertEqual|expected', 501));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0009|HistoryCoverage.test.ets|assert0051|assertFalse|actual|expected=false', rows[0].id === rows[1].id)).assertFalse();
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1000
     * @tc.name      testAutoStartupHistoryCoverage0010
     * @tc.desc      Verify long platform message is bounded before and after restore
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0010', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const long: BusinessError = new Error('x'.repeat(600)) as BusinessError;
      long.code = 16000050;
      f.service.refresh(RefreshSource.MANUAL);
      f.clock.advance(5);
      f.api.rejectNext(long);
      await flushMicrotasks();
      await f.service.whenSaved();
      const message = f.service.records()[0].errorMessage;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0052|assertTrue|actual|expected=true', message.length <= 512)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0053|assertEqual|actual', f.storage.value.indexOf('x'.repeat(513)))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0053|assertEqual|expected', -1));

      const restored = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0054|assertEqual|actual', restored.records().length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0054|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0055|assertTrue|actual|expected=true', restored.records()[0].errorMessage.length <= 512)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0056|assertEqual|actual', restored.historyNotice())).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0010|HistoryCoverage.test.ets|assert0056|assertEqual|expected', ''));
      } finally {
        restored.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1100
     * @tc.name      testAutoStartupHistoryCoverage0011
     * @tc.desc      Verify reopen append reopen keeps ids unique and ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0011', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const now = f.clock.now();
      const values: QueryRecord[] = [];
      for (let index = 0; index < 20; index++) {
        values.push(record(100 + index, now - (index + 1) * 1000, '未开启', QueryOutcome.SUCCESS));
      }
      f.storage.value = stored(values);
      const first = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        first.refresh(RefreshSource.MANUAL);
        f.clock.advance(5);
        f.api.resolveNext(true);
        await flushMicrotasks();
        await first.whenSaved();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0057|assertEqual|actual', first.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0057|assertEqual|expected', 120));
      } finally {
        first.dispose();
      }
      const second = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0058|assertEqual|actual', second.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0058|assertEqual|expected', 120));
        second.refresh(RefreshSource.SETTINGS);
        f.clock.advance(5);
        f.api.resolveNext(false);
        await flushMicrotasks();
        await second.whenSaved();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0059|assertEqual|actual', second.records()[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0059|assertEqual|expected', 121));
        const ids: number[] = second.records().map((row: QueryRecord): number => row.id);
        const unique: number[] = [];
        ids.forEach((id: number): void => {
          if (unique.indexOf(id) < 0) {
            unique.push(id);
          }
        });
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0060|assertEqual|actual', unique.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0011|HistoryCoverage.test.ets|assert0060|assertEqual|expected', ids.length));
      } finally {
        second.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1200
     * @tc.name      testAutoStartupHistoryCoverage0012
     * @tc.desc      Verify summary comparison and advanced filter use persisted outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0012', 0, async (): Promise<void> => {
      configureTestText();
      const f = fixture;
      const now = f.clock.now();
      const records: QueryRecord[] = [
        record(12, now - 1000, '已开启', QueryOutcome.SUCCESS),
        record(11, now - 2000, '查询失败', QueryOutcome.FAILURE),
        record(10, now - 3000, '未调用', QueryOutcome.UNSUPPORTED)
      ];
      f.storage.value = stored(records);
      const service = new AutoStartupService(f.api, f.clock, f.storage);
      try {
        const summary = service.historySummary();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0061|assertEqual|actual', summary.total)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0061|assertEqual|expected', 3));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0062|assertEqual|actual', summary.success)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0062|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0063|assertEqual|actual', summary.failure)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0063|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0064|assertEqual|actual', summary.unsupported)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0064|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0065|assertEqual|actual', summary.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0065|assertEqual|expected', 12));
        const comparison = service.historyComparison();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0066|assertEqual|actual', comparison.beforeId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0066|assertEqual|expected', 11));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0067|assertEqual|actual', comparison.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0067|assertEqual|expected', 12));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0068|assertTrue|actual|expected=true', comparison.changed)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0069|assertEqual|actual', comparison.deltaMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0069|assertEqual|expected', 1000));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0070|assertEqual|actual', service.filteredHistory('', QueryOutcome.FAILURE, 0, 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0070|assertEqual|expected', 1));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0071|assertEqual|actual', service.filteredHistory('', '', now - 2500, 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0071|assertEqual|expected', 2));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0072|assertEqual|actual', service.filteredHistory(RefreshSource.MANUAL, '', 0, 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0072|assertEqual|expected', 3));
        const latest = service.latestValidRecord();
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0073|assertTrue|actual|expected=true', latest !== undefined)).assertTrue();
        if (latest !== undefined) {
          expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0074|assertEqual|actual', latest.id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0012|HistoryCoverage.test.ets|assert0074|assertEqual|expected', 12));
        }
      } finally {
        service.dispose();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYCOVERAGE_1300
     * @tc.name      testAutoStartupHistoryCoverage0013
     * @tc.desc      Verify message boundary keeps512 and truncates513
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testAutoStartupHistoryCoverage0013', 0, async (): Promise<void> => {
      configureTestText();
      const first = fixture;
      const exact: BusinessError = new Error('y'.repeat(512)) as BusinessError;
      exact.code = 16000050;
      first.service.refresh(RefreshSource.MANUAL);
      first.clock.advance(5);
      first.api.rejectNext(exact);
      await flushMicrotasks();
      await first.service.whenSaved();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0013|HistoryCoverage.test.ets|assert0075|assertEqual|actual', first.service.records()[0].errorMessage.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0013|HistoryCoverage.test.ets|assert0075|assertEqual|expected', 512));

      const second = new HistoryFixture();
      try {
        const longer: BusinessError = new Error('z'.repeat(513)) as BusinessError;
        longer.code = 16000050;
        second.service.refresh(RefreshSource.MANUAL);
        second.clock.advance(5);
        second.api.rejectNext(longer);
        await flushMicrotasks();
        await second.service.whenSaved();
        const message = second.service.records()[0].errorMessage;
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0013|HistoryCoverage.test.ets|assert0076|assertEqual|actual', message.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0013|HistoryCoverage.test.ets|assert0076|assertEqual|expected', 512));
        expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryCoverage_0013|HistoryCoverage.test.ets|assert0077|assertTrue|actual|expected=true', message.endsWith('…'))).assertTrue();
      } finally {
        second.service.dispose();
        second.clock.clearAll();
        second.api.finishPending();
        await flushMicrotasks();
      }
    });
  });
}
