/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { systemDateTime } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import player, { PlaybackInfo, PlaybackResult } from 'libplayer.so';
import { PlaybackViewModel } from '../../../main/ets/viewmodel/PlaybackViewModel';
import { PlayerSettingsModel } from '../../../main/ets/model/PlayerSettingsModel';
import { runAsyncTestCase } from './TestCaseLogger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVCodec]';
const SAMPLE_COUNT: number = 8;
const POLL_INTERVAL_MS: number = 250;
const BENCHMARK_SUITE: string = 'PlaybackPollingBenchmark';
const BUNDLE: string = 'AVCodec_';
const CLEANUP_TIMEOUT_MS: number = 1500;
const WARMUP_COUNT: number = 4;
const STARTUP_SETTLE_MS: number = 150;
const NANOSECONDS_PER_MICROSECOND: number = 1000;

interface PlaybackPollingSummary {
  mode: string;
  samples: number;
  snapshotCharacters: number;
  readMeanUs: number;
  readMaxUs: number;
  updateMeanUs: number;
  updateMaxUs: number;
}

function nowUs(): number {
  return systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, true) / NANOSECONDS_PER_MICROSECOND;
}

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void): void => { setTimeout(resolve, ms); });
}

function mean(values: number[]): number {
  return values.reduce((sum: number, value: number): number => sum + value, 0) / values.length;
}

// 仅显式选择性能套件时注册，普通功能回归不启动媒体或依赖外部素材。
function isBenchmarkSelected(): boolean {
  const parameters: Record<string, string> = abilityDelegatorRegistry.getArguments().parameters;
  const selected: string = parameters['class'] ?? parameters['-s class'] ?? '';
  return selected.split(',').some((value: string): boolean => value.split('#')[0] === BENCHMARK_SUITE);
}

class BenchmarkPlayback {
  private input: fileIo.File | undefined = undefined;
  private submitted: boolean = false;
  private finished: boolean = false;
  private closeRequested: boolean = false;
  private resolveCompleted: () => void = (): void => {};
  private completion: Promise<void>;

  constructor() {
    this.completion = new Promise<void>((resolve: () => void): void => { this.resolveCompleted = resolve; });
  }

  // 输入保持打开，直到Native完成通知确认不再使用。
  public start(path: string): boolean {
    this.input = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
    const settings: PlayerSettingsModel = new PlayerSettingsModel();
    settings.audioVolume = 0;
    try {
      const started: boolean = player.play(settings.createPlayOptions({
        inputFileFd: this.input.fd, inputFileOffset: 0, inputFileSize: fileIo.statSync(this.input.fd).size,
        isSmartFluencySupported: false
      }), (_result: PlaybackResult): void => {
        this.finished = true;
        this.resolveCompleted();
        if (this.closeRequested) { this.closeInput(); }
      });
      this.submitted = started || player.getState() !== player.PlayerState.IDLE;
      return started;
    } catch (error) {
      this.submitted = player.getState() !== player.PlayerState.IDLE;
      throw new Error(String(error));
    }
  }

  // 超时仍由完成回调负责关闭，不提前归还Native借用的输入。
  public async stopAndClose(): Promise<void> {
    this.closeRequested = true;
    if (!this.submitted || this.finished) { this.closeInput(); return; }
    player.stop();
    await Promise.race([this.completion, delay(CLEANUP_TIMEOUT_MS)]);
    if (!this.finished) { throw new Error('Benchmark playback cleanup is still pending'); }
  }

  private closeInput(): void {
    const input: fileIo.File | undefined = this.input;
    this.input = undefined;
    if (input === undefined) { return; }
    try { fileIo.closeSync(input); } catch (error) {
      hilog.error(DOMAIN, TAG, 'Close benchmark input failed: %{public}s', String(error));
    }
  }
}

async function measure(mode: string): Promise<PlaybackPollingSummary> {
  const model: PlaybackViewModel = new PlaybackViewModel();
  const reads: number[] = [];
  const updates: number[] = [];
  for (let warmup: number = 0; warmup < WARMUP_COUNT; ++warmup) { model.update(); }
  let characters: number = 0;
  for (let sample: number = 0; sample < SAMPLE_COUNT; ++sample) {
    await delay(POLL_INTERVAL_MS);
    let began: number = nowUs();
    const snapshot: PlaybackInfo = player.getPlaybackInfo();
    reads.push(nowUs() - began);
    characters = Math.max(characters, JSON.stringify(snapshot).length);
    began = nowUs();
    model.update();
    updates.push(nowUs() - began);
  }
  return { mode: mode, samples: reads.length, snapshotCharacters: characters,
    readMeanUs: mean(reads), readMaxUs: Math.max(...reads),
    updateMeanUs: mean(updates), updateMaxUs: Math.max(...updates) };
}

function saveSummary(cacheDir: string, summary: PlaybackPollingSummary): void {
  const text: string = JSON.stringify(summary);
  hilog.info(DOMAIN, TAG, 'Polling benchmark: %{public}s', text);
  const output: fileIo.File = fileIo.openSync(`${cacheDir}/polling-${summary.mode}.json`,
    fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
  let closeFailure: Error | undefined = undefined;
  try {
    fileIo.writeSync(output.fd, text);
  } finally {
    try { fileIo.closeSync(output); } catch (error) {
      closeFailure = error as Error;
      hilog.error(DOMAIN, TAG, 'Close benchmark summary failed: %{public}s', String(error));
    }
  }
  if (closeFailure !== undefined) { throw closeFailure; }
}

function assertState(caseName: string, stage: string, expected: number): void {
  const actual: number = player.getState();
  hilog.info(DOMAIN, TAG, '%{public}s %{public}s state=%{public}d expected=%{public}d',
    caseName, stage, actual, expected);
  expect(actual).assertEqual(expected);
}

async function preparePlayback(caseName: string, cacheDir: string, mode: string,
  playback: BenchmarkPlayback): Promise<void> {
  if (mode === 'idle') { return; }
  const started: boolean = playback.start(`${cacheDir}/polling-fixture.m4a`);
  hilog.info(DOMAIN, TAG, '%{public}s startup started=%{public}s expected=true', caseName, String(started));
  expect(started).assertTrue();
  await delay(STARTUP_SETTLE_MS);
  assertState(caseName, 'startup', player.PlayerState.PLAYING);
  if (mode === 'paused') {
    const paused: boolean = player.pause();
    hilog.info(DOMAIN, TAG, '%{public}s pause result=%{public}s expected=true', caseName, String(paused));
    expect(paused).assertTrue();
  }
}

function assertSummary(caseName: string, mode: string, summary: PlaybackPollingSummary): void {
  hilog.info(DOMAIN, TAG, '%{public}s samples=%{public}d expected=%{public}d', caseName, summary.samples, SAMPLE_COUNT);
  expect(summary.samples).assertEqual(SAMPLE_COUNT);
  const finite: boolean = Number.isFinite(summary.updateMeanUs);
  hilog.info(DOMAIN, TAG, '%{public}s updateMeanUs=%{public}s finite=%{public}s expected=true',
    caseName, String(summary.updateMeanUs), String(finite));
  expect(finite).assertTrue();
  const expectedState: number = mode === 'idle' ? player.PlayerState.IDLE :
    mode === 'paused' ? player.PlayerState.PAUSED : player.PlayerState.PLAYING;
  assertState(caseName, 'completed', expectedState);
}

async function runBenchmark(caseName: string, mode: string): Promise<void> {
  const cacheDir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().cacheDir;
  const playback: BenchmarkPlayback = new BenchmarkPlayback();
  let cleanupFailure: Error | undefined = undefined;
  hilog.info(DOMAIN, TAG, '%{public}s mode=%{public}s samples=%{public}d intervalMs=%{public}d',
    caseName, mode, SAMPLE_COUNT, POLL_INTERVAL_MS);
  assertState(caseName, 'initial', player.PlayerState.IDLE);
  try {
    await preparePlayback(caseName, cacheDir, mode, playback);
    const summary: PlaybackPollingSummary = await measure(mode);
    saveSummary(cacheDir, summary);
    assertSummary(caseName, mode, summary);
  } finally {
    try { await playback.stopAndClose(); } catch (error) {
      cleanupFailure = error as Error;
      hilog.error(DOMAIN, TAG, '%{public}s cleanup failed: %{public}s', caseName, String(error));
    }
  }
  if (cleanupFailure !== undefined) { throw cleanupFailure; }
}

export default function playbackPollingBenchmarkTest(): void {
  if (!isBenchmarkSelected()) { return; }
  describe(BENCHMARK_SUITE, (): void => {
    // 无播放任务时测量轮询，不打开外部素材。
    it(`${BUNDLE}Polling_Idle_001`, 0, async (): Promise<void> => {
      await runAsyncTestCase(`${BUNDLE}Polling_Idle_001`, async (): Promise<void> => {
        await runBenchmark(`${BUNDLE}Polling_Idle_001`, 'idle');
      });
    });
    // cacheDir中已有音频素材，保持播放并测量轮询。
    it(`${BUNDLE}Polling_Playing_002`, 0, async (): Promise<void> => {
      await runAsyncTestCase(`${BUNDLE}Polling_Playing_002`, async (): Promise<void> => {
        await runBenchmark(`${BUNDLE}Polling_Playing_002`, 'playing');
      });
    });
    // cacheDir中已有音频素材，起播后暂停并测量轮询。
    it(`${BUNDLE}Polling_Paused_003`, 0, async (): Promise<void> => {
      await runAsyncTestCase(`${BUNDLE}Polling_Paused_003`, async (): Promise<void> => {
        await runBenchmark(`${BUNDLE}Polling_Paused_003`, 'paused');
      });
    });
  });
}
