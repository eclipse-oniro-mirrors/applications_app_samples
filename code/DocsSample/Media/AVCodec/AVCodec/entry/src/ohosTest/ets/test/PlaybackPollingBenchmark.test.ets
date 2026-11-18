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
  return systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, true) / 1000;
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
    await Promise.race([this.completion, delay(1500)]);
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
  for (let warmup: number = 0; warmup < 4; ++warmup) { model.update(); }
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
  const output: fileIo.File = fileIo.openSync(cacheDir + '/polling-' + summary.mode + '.json',
    fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
  try { fileIo.writeSync(output.fd, text); } finally { fileIo.closeSync(output); }
}

async function runBenchmark(mode: string): Promise<void> {
  const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  const playback: BenchmarkPlayback = new BenchmarkPlayback();
  hilog.info(DOMAIN, TAG, 'Polling parameters: mode=%{public}s samples=%{public}d intervalMs=%{public}d',
    mode, SAMPLE_COUNT, POLL_INTERVAL_MS);
  expect(player.getState()).assertEqual(player.PlayerState.IDLE);
  try {
    if (mode !== 'idle') {
      const started: boolean = playback.start(context.cacheDir + '/polling-fixture.m4a');
      const state: number = player.getState();
      hilog.info(DOMAIN, TAG, 'Polling startup: started=%{public}s state=%{public}d',
        String(started), state);
      expect(started).assertTrue();
      await delay(150);
      expect(player.getState()).assertEqual(player.PlayerState.PLAYING);
      if (mode === 'paused') { expect(player.pause()).assertTrue(); }
    }
    const summary: PlaybackPollingSummary = await measure(mode);
    saveSummary(context.cacheDir, summary);
    expect(summary.samples).assertEqual(SAMPLE_COUNT);
    expect(Number.isFinite(summary.updateMeanUs)).assertTrue();
    const expectedState: number = mode === 'idle' ? player.PlayerState.IDLE :
      mode === 'paused' ? player.PlayerState.PAUSED : player.PlayerState.PLAYING;
    expect(player.getState()).assertEqual(expectedState);
  } finally { await playback.stopAndClose(); }
}

export default function playbackPollingBenchmarkTest(): void {
  if (!isBenchmarkSelected()) { return; }
  describe(BENCHMARK_SUITE, (): void => {
    it('AVCodec_Polling_Idle_001', 0, async (): Promise<void> => {
      await runAsyncTestCase('AVCodec_Polling_Idle_001', async (): Promise<void> => {
        await runBenchmark('idle');
      });
    });
    it('AVCodec_Polling_Playing_002', 0, async (): Promise<void> => {
      await runAsyncTestCase('AVCodec_Polling_Playing_002', async (): Promise<void> => {
        await runBenchmark('playing');
      });
    });
    it('AVCodec_Polling_Paused_003', 0, async (): Promise<void> => {
      await runAsyncTestCase('AVCodec_Polling_Paused_003', async (): Promise<void> => {
        await runBenchmark('paused');
      });
    });
  });
}
