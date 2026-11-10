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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SHOW_ID,
  BUTTON_IDS,
  getDriver,
  startApp,
  stationarySupported,
  expectedTextFor,
  resetStatusText
} from './StationaryUiSupport';

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';
const POLL_MS: number = 20;
const MAX_POLLS: number = 150;
const UPPER_BOUND_MS: number = 3000;
const BASELINE_ROUNDS: number = 3;

async function readShow(driver: Driver): Promise<string | null> {
  const target: Component | null = await driver.findComponent(ON.id(SHOW_ID));
  return target === null ? null : await target.getText();
}

/**
 * 点击并测量"文案变化"发生时刻，单位为毫秒；在等待窗口内未观察到变化时返回 null。
 */
async function measureClick(driver: Driver, id: string, expected: string): Promise<number | null> {
  const button: Component | null = await driver.findComponent(ON.id(id));
  if (button === null) {
    return null;
  }
  const start: number = Date.now();
  await button.click();
  for (let poll = 0; poll < MAX_POLLS; poll++) {
    if (await readShow(driver) === expected) {
      return Date.now() - start;
    }
    await driver.delayMs(POLL_MS);
  }
  return null;
}

/** 短轮询 2s，用于确认文案已落定；未落定返回 null，避免借用 30s 的长轮询。 */
async function settledText(driver: Driver, expected: string): Promise<string | null> {
  for (let poll = 0; poll < 100; poll++) {
    const current: string | null = await readShow(driver);
    if (current === expected) {
      return current;
    }
    await driver.delayMs(POLL_MS);
  }
  return null;
}

function average(samples: number[]): number {
  let sum: number = 0;
  for (const sample of samples) {
    sum += sample;
  }
  return samples.length === 0 ? 0 : Math.round(sum / samples.length);
}

function maxOf(samples: number[]): number {
  let max: number = 0;
  for (const sample of samples) {
    max = Math.max(max, sample);
  }
  return max;
}

function minOf(samples: number[]): number {
  let min: number = Number.MAX_SAFE_INTEGER;
  for (const sample of samples) {
    min = Math.min(min, sample);
  }
  return samples.length === 0 ? 0 : min;
}

/**
 * 页面响应性能与渲染稳定性
 *
 * 只使用设备上真实可测的量：点击到状态文本落定的耗时、重复操作后文案是否漂移、
 * 反复查询控件是否仍可获取。耗时用例采用宽松上界（3s），并额外断言最慢一次
 * 不超过最快一次的 10 倍，用于发现"偶发卡死"类退化，而不是做精确基准。
 * stationary 不支持的设备上文案不变，耗时用例会直接跳过（不做虚假断言）。
 */
export default function StationaryPerfTest() {
  describe('StationaryPerfTest', () => {
    beforeAll(async () => {
      await startApp();
    });

    /**
     * @tc.number SUB_STATIONARY_PERF_0100
     * @tc.name testPerfClickLatency1
     * @tc.desc Verify every action settles the status text within the soft time bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfClickLatency1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      const before: string = await resetStatusText(driver);
      const supported: boolean = stationarySupported();
      for (let index = 0; index < BUTTON_IDS.length; index++) {
        const expected: string = expectedTextFor(index, before);
        const cost: number | null = await measureClick(driver, BUTTON_IDS[index], expected);
        hilog.info(DOMAIN, TAG, '%{public}s settle cost=%{public}s ms', BUTTON_IDS[index], `${cost}`);
        if (supported) {
          expect(cost !== null).assertTrue();
          expect(cost !== null && cost < UPPER_BOUND_MS).assertTrue();
        } else {
          expect(await settledText(driver, before)).assertEqual(before);
        }
      }
    });

    /**
     * @tc.number SUB_STATIONARY_PERF_0200
     * @tc.name testPerfClickLatency2
     * @tc.desc Verify repeated subscribe settles within bound and without outliers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfClickLatency2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      const before: string = await resetStatusText(driver);
      if (!stationarySupported()) {
        hilog.info(DOMAIN, TAG, 'stationary unsupported, latency sampling skipped');
        expect(before.length > 0).assertTrue();
        expect(await settledText(driver, before)).assertEqual(before);
        return;
      }
      const expected: string = expectedTextFor(0, before);
      const samples: number[] = [];
      for (let round = 0; round < BASELINE_ROUNDS + 2; round++) {
        await resetStatusText(driver);
        const cost: number | null = await measureClick(driver, BUTTON_IDS[0], expected);
        if (cost === null) {
          hilog.error(DOMAIN, TAG, 'subscribe round %{public}d did not settle', round);
          continue;
        }
        samples.push(cost);
      }
      expect(samples.length).assertEqual(BASELINE_ROUNDS + 2);
      if (samples.length !== BASELINE_ROUNDS + 2) {
        return;
      }
      const fastest: number = minOf(samples);
      const slowest: number = maxOf(samples);
      hilog.info(DOMAIN, TAG, 'subscribe samples fastest=%{public}d avg=%{public}d slowest=%{public}d',
        fastest, average(samples), slowest);
      expect(slowest < UPPER_BOUND_MS).assertTrue();
      expect(slowest <= Math.max(fastest, 1) * 10).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_PERF_0300
     * @tc.name testPerfStable1
     * @tc.desc Verify twenty subscribe clicks never drift the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfStable1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      const before: string = await resetStatusText(driver);
      const expected: string = expectedTextFor(0, before);
      const button: Component | null = await driver.findComponent(ON.id(BUTTON_IDS[0]));
      expect(button !== null).assertTrue();
      if (button === null) {
        return;
      }
      for (let round = 0; round < 20; round++) {
        await button.click();
        expect(await settledText(driver, expected)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_STATIONARY_PERF_0400
     * @tc.name testPerfStable2
     * @tc.desc Verify every control stays reachable after repeated queries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfStable2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      const ids: string[] = [SHOW_ID].concat(BUTTON_IDS);
      for (let round = 0; round < 10; round++) {
        for (const id of ids) {
          const target: Component | null = await driver.findComponent(ON.id(id));
          expect(target !== null).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_STATIONARY_PERF_0500
     * @tc.name testPerfRecovery1
     * @tc.desc Verify the page settles back to the idle text after a long click burst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfRecovery1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      const before: string = await resetStatusText(driver);
      for (let round = 0; round < 5; round++) {
        for (const id of BUTTON_IDS) {
          const button: Component | null = await driver.findComponent(ON.id(id));
          expect(button !== null).assertTrue();
          if (button !== null) {
            await button.click();
          }
        }
      }
      const idle: string = await resetStatusText(driver);
      expect(idle).assertEqual(before);
      expect(await settledText(driver, before)).assertEqual(before);
    });
  });
}
