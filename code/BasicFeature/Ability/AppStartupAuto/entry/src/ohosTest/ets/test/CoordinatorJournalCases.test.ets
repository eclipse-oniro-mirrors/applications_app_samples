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
import { QueryClock } from '../../../main/ets/autostart/AutoStartupRuntime';
import { QueryOutcome, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import {
  StartupTelemetry, SystemStartupTelemetry, safeBegin, safeEnd, safeEvent
} from '../../../main/ets/autostart/Telemetry';

/** 手动推进的时钟：能观察待触发的计时器，避免用例依赖真实时间。 */
class ManualClock implements QueryClock {
  private current: number = 0;
  private nextTimerId: number = 0;
  private pending: (() => void) | null = null;
  private pendingDelay: number = -1;

  now(): number {
    return this.current;
  }

  monotonicNow(): number {
    return this.current;
  }

  setTimeout(callback: () => void, delayMillis: number): number {
    this.nextTimerId++;
    this.pending = callback;
    this.pendingDelay = delayMillis;
    return this.nextTimerId;
  }

  clearTimeout(_id: number): void {
    this.pending = null;
    this.pendingDelay = -1;
  }

  advance(delta: number): void {
    this.current += delta;
  }

  /** 触发挂起的计时器；返回是否真的触发了。 */
  fire(): boolean {
    const callback: (() => void) | null = this.pending;
    this.pending = null;
    if (callback === null) {
      return false;
    }
    callback();
    return true;
  }

  hasPending(): boolean {
    return this.pending !== null;
  }

  lastDelay(): number {
    return this.pendingDelay;
  }
}

/** 记录调用的假采集器。 */
class RecordingTelemetry implements StartupTelemetry {
  public beginCount: number = 0;
  public endCount: number = 0;
  public eventCount: number = 0;
  public lastOperation: string = '';
  public lastOutcome: string = '';

  begin(operation: string, _id: number): void {
    this.beginCount++;
    this.lastOperation = operation;
  }

  end(operation: string, _id: number, outcome: string): void {
    this.endCount++;
    this.lastOperation = operation;
    this.lastOutcome = outcome;
  }

  event(operation: string, _id: number, outcome: string): void {
    this.eventCount++;
    this.lastOperation = operation;
    this.lastOutcome = outcome;
  }
}

/** 任意入口都抛异常的采集器，用于验证隔离边界。 */
class ThrowingTelemetry implements StartupTelemetry {
  public calls: number = 0;

  begin(_operation: string, _id: number): void {
    this.calls++;
    throw new Error('collector down');
  }

  end(_operation: string, _id: number, _outcome: string): void {
    this.calls++;
    throw new Error('collector down');
  }

  event(_operation: string, _id: number, _outcome: string): void {
    this.calls++;
    throw new Error('collector down');
  }
}

export default function coordinatorJournalCasesTest(): void {

  describe('TelemetryCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_TELEMETRYCASES_0100
     * @tc.name      testTelemetryCases0001
     * @tc.desc      Verify safe wrappers forward to sink
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTelemetryCases0001', 0, (): void => {
      const sink: RecordingTelemetry = new RecordingTelemetry();
      safeBegin(sink, 'query', 1);
      safeEnd(sink, 'query', 1, 'success');
      safeEvent(sink, 'query', 1, 'failure');
      expect(sink.beginCount).assertEqual(1);
      expect(sink.endCount).assertEqual(1);
      expect(sink.eventCount).assertEqual(1);
      expect(sink.lastOperation).assertEqual('query');
      expect(sink.lastOutcome).assertEqual('failure');
    });

    /**
     * @tc.number    SUB_STARTUP_TELEMETRYCASES_0200
     * @tc.name      testTelemetryCases0002
     * @tc.desc      Verify safe wrappers swallow sink exceptions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTelemetryCases0002', 0, (): void => {
      const sink: ThrowingTelemetry = new ThrowingTelemetry();
      let leaked: boolean = false;
      try {
        safeBegin(sink, 'query', 1);
        safeEnd(sink, 'query', 1, 'success');
        safeEvent(sink, 'query', 1, 'failure');
      } catch (_) {
        leaked = true;
      }
      expect(leaked).assertFalse();
      expect(sink.calls).assertEqual(3);
      expect(sink instanceof ThrowingTelemetry).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_TELEMETRYCASES_0300
     * @tc.name      testTelemetryCases0003
     * @tc.desc      Verify system telemetry never throws
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTelemetryCases0003', 0, (): void => {
      const sink: SystemStartupTelemetry = new SystemStartupTelemetry();
      let leaked: boolean = false;
      try {
        sink.begin('query', 1);
        sink.end('query', 1, 'success');
        sink.event('query', 2, 'failure');
      } catch (_) {
        leaked = true;
      }
      expect(leaked).assertFalse();
      expect(sink instanceof SystemStartupTelemetry).assertTrue();
      const repeated: SystemStartupTelemetry = new SystemStartupTelemetry();
      safeBegin(repeated, 'query', 9);
      expect(repeated instanceof SystemStartupTelemetry).assertTrue();
    });
  });
}
