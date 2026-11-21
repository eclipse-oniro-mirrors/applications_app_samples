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

import { common } from '@kit.AbilityKit';
import player, { PlaybackResult } from 'libplayer.so';
import { PlayerSettingsModel } from '../model/PlayerSettingsModel';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { PlaybackStartupController, PlaybackStartupResult } from './PlaybackStartupController';
import { PlaybackUriAccessController } from './PlaybackUriAccessController';

// prepare异步授权；launch先移交租约再异步启动，completed由Native释放后通知。
// 定时器保存回调直至执行或取消；流程负责代次校验，启动器负责文件与租约释放。
export interface PlaybackFlowRuntime {
  stoppingState: number;
  playingState: number;
  pausedState: number;
  isTranscoding: () => boolean;
  prepare: (path: string, context: common.Context | undefined) => Promise<void>;
  launch: (context: common.Context | undefined, path: string, settings: PlayerSettingsModel,
    smartFluency: boolean, prepare: (lease: MediaTaskLease) => void,
    completed: (result: PlaybackResult, cleanupPending: boolean) => void) => Promise<PlaybackStartupResult>;
  cancelling: (lease: MediaTaskLease) => void;
  stop: () => boolean;
  getState: () => number;
  completedDuration: () => number;
  restoreControls: (speed: number, paused: boolean, volume: number) => void;
  setSpeed: (speed: number) => void;
  setPaused: (paused: boolean) => boolean;
  restoreAfterSeek: (speed: number, thermalWarning: boolean) => void;
  schedule: (callback: () => void, delayMs: number) => number;
  cancelTimer: (id: number) => void;
}

export class SystemPlaybackFlowRuntime implements PlaybackFlowRuntime {
  public stoppingState: number = player.PlayerState.STOPPING;
  public playingState: number = player.PlayerState.PLAYING;
  public pausedState: number = player.PlayerState.PAUSED;

  // 起播前读取转码占用状态。
  isTranscoding(): boolean { return MediaFileActivity.isTranscoding(); }

  // URI授权及可用性准备完成后，流程再次核对取消代次。
  prepare(path: string, context: common.Context | undefined): Promise<void> {
    return PlaybackUriAccessController.prepare(path, context);
  }

  // Native初始化与启动在工作线程执行，输入保留到完成通知。
  launch(context: common.Context | undefined, path: string, settings: PlayerSettingsModel,
    smartFluency: boolean, prepare: (lease: MediaTaskLease) => void,
    completed: (result: PlaybackResult, cleanupPending: boolean) => void): Promise<PlaybackStartupResult> {
    return PlaybackStartupController.launch(context, path, settings, smartFluency, prepare, completed);
  }

  // 标记取消，不在Native完成前释放租约。
  cancelling(lease: MediaTaskLease): void { MediaTaskCoordinator.cancelling(lease); }

  // 返回停止请求是否受理，最终释放仍由完成通知确认。
  stop(): boolean { return player.stop(); }

  // 停止被拒绝时读取当前Native状态。
  getState(): number { return player.getState(); }

  // 页面尚未刷新时，从已完成任务快照取得时长。
  completedDuration(): number { return player.getCompletedPlaybackInfo().durationUs; }

  // 错误恢复按音量、倍速、暂停顺序恢复控制项。
  restoreControls(speed: number, paused: boolean, volume: number): void {
    player.setVolume(volume);
    player.setPlaybackSpeed(speed);
    if (paused) { player.pause(); }
  }

  // 普通倍速命令与Seek收尾使用同一Native入口。
  setSpeed(speed: number): void { player.setPlaybackSpeed(speed); }

  // 仅返回操作结果，页面展示和会话刷新由调用方处理。
  setPaused(paused: boolean): boolean { return paused ? player.pause() : player.resume(); }

  // Seek后按当前期望倍速和温控状态恢复，避免使用提交时的旧配置。
  restoreAfterSeek(speed: number, thermalWarning: boolean): void {
    this.setSpeed(speed);
    if (thermalWarning) {
      player.onThermalWarningReceived(0.3);
    } else {
      player.onThermalLevelRecovered();
    }
  }

  // 保存一次性延迟回调，返回可取消的定时器标识。
  schedule(callback: () => void, delayMs: number): number { return setTimeout(callback, delayMs); }

  // 离页、停止或新任务启动时取消尚未执行的恢复Seek。
  cancelTimer(id: number): void { clearTimeout(id); }
}
