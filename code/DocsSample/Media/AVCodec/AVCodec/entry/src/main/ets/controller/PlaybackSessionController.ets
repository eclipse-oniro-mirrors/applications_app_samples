/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

import { avSession } from '@kit.AVSessionKit';
import { common, wantAgent } from '@kit.AbilityKit';
import Logger from '../common/utils/Logger';

const TAG: string = 'PlaybackSessionController';
const DEFAULT_SKIP_SECONDS: number = 15;

export interface PlaybackSessionCallbacks {
  onPlay: () => void;
  onPause: () => void;
  onStop: () => void;
  onNext: () => void;
  onPrevious: () => void;
  onSeek: (positionMs: number) => void;
  onFastForward: (offsetSeconds: number) => void;
  onRewind: (offsetSeconds: number) => void;
  onSetSpeed: (speed: number) => void;
}

export interface PlaybackSessionMedia {
  assetId: string;
  title: string;
  queueTitle: string;
  durationMs: number;
  hasVideo: boolean;
  queueTitles: string[];
  queueIndex: number;
}

export class PlaybackSessionController {
  private session: avSession.AVSession | undefined = undefined;
  private sessionType: avSession.AVSessionType | undefined = undefined;
  private callbacks: PlaybackSessionCallbacks | undefined = undefined;
  private generation: number = 0;
  private listenerRegistered: boolean = false;
  private operations: Promise<void> = Promise.resolve();
  private sessionActive: boolean = false;
  // AVSession未激活时暂存最新播放状态，激活后再同步给系统媒体控件。
  private pendingPlaybackState: avSession.AVPlaybackState | undefined = undefined;

  start(context: common.UIAbilityContext, media: PlaybackSessionMedia,
    callbacks: PlaybackSessionCallbacks): Promise<void> {
    const currentGeneration = ++this.generation;
    this.callbacks = undefined;
    this.sessionActive = false;
    const task: Promise<void> = this.operations.then(async (): Promise<void> => {
      if (currentGeneration !== this.generation) {
        return;
      }
      this.callbacks = callbacks;
      await this.startSession(context, media, currentGeneration);
    }).catch(async (error: Error): Promise<void> => {
      Logger.error(TAG, `Start AVSession failed: ${JSON.stringify(error)}`);
      if (currentGeneration === this.generation) {
        this.callbacks = undefined;
        this.sessionActive = false;
        const failedSession = this.clearSession();
        if (failedSession !== undefined) {
          await this.destroySession(failedSession);
        }
      }
    });
    this.operations = task;
    return task;
  }

  private async startSession(context: common.UIAbilityContext, media: PlaybackSessionMedia,
    currentGeneration: number): Promise<void> {
    const requiredSessionType: avSession.AVSessionType = media.hasVideo ? 'video' : 'audio';
    if (this.session !== undefined && this.sessionType !== requiredSessionType) {
      const previousSession = this.session;
      this.session = undefined;
      this.sessionType = undefined;
      this.listenerRegistered = false;
      await this.destroySession(previousSession);
      if (currentGeneration !== this.generation) {
        return;
      }
    }
    if (this.session === undefined) {
      const createdSession = await avSession.createAVSession(context, 'AVCodecPlayer',
        requiredSessionType);
      if (currentGeneration !== this.generation) {
        await createdSession.destroy();
        return;
      }
      this.session = createdSession;
      this.sessionType = requiredSessionType;
    }
    if (currentGeneration !== this.generation || this.session === undefined) {
      return;
    }
    const currentSession = this.session;
    this.registerListeners(currentSession, currentGeneration);
    const metadata: avSession.AVMetadata = {
      assetId: media.assetId,
      title: media.title,
      duration: media.durationMs,
      skipIntervals: avSession.SkipIntervals.SECONDS_15,
      avQueueName: media.queueTitle,
      avQueueId: 'avcodec-playback-queue'
    };
    const previousAssetId = this.getQueueAssetId(media.queueIndex - 1, media.queueTitles.length);
    const nextAssetId = this.getQueueAssetId(media.queueIndex + 1, media.queueTitles.length);
    if (previousAssetId !== undefined) {
      metadata.previousAssetId = previousAssetId;
    }
    if (nextAssetId !== undefined) {
      metadata.nextAssetId = nextAssetId;
    }
    await currentSession.setAVMetadata(metadata);
    if (!this.isCurrentSession(currentSession, currentGeneration)) {
      return;
    }
    const queueItems: avSession.AVQueueItem[] = this.createQueueItems(media.queueTitles);
    if (queueItems.length > 0) {
      await currentSession.setAVQueueItems(queueItems);
      if (!this.isCurrentSession(currentSession, currentGeneration)) {
        return;
      }
      await currentSession.setAVQueueTitle(media.queueTitle);
    }
    if (!this.isCurrentSession(currentSession, currentGeneration)) {
      return;
    }
    await this.setLaunchAbility(context, currentGeneration);
    if (!this.isCurrentSession(currentSession, currentGeneration)) {
      return;
    }
    await currentSession.activate();
    if (!this.isCurrentSession(currentSession, currentGeneration)) {
      return;
    }
    const initialState: avSession.AVPlaybackState = this.pendingPlaybackState ?? {
      state: avSession.PlaybackState.PLAYBACK_STATE_PLAY,
      speed: 1,
      position: {
        elapsedTime: 0,
        updateTime: Date.now()
      },
      duration: Math.max(0, media.durationMs)
    };
    this.pendingPlaybackState = undefined;
    await currentSession.setAVPlaybackState(initialState);
    if (this.isCurrentSession(currentSession, currentGeneration)) {
      this.sessionActive = true;
      this.queuePlaybackState(currentSession, currentGeneration);
    }
  }

  private isCurrentSession(currentSession: avSession.AVSession, generation: number): boolean {
    return generation === this.generation && this.session === currentSession;
  }

  private queuePlaybackState(currentSession: avSession.AVSession, generation: number): void {
    const task: Promise<void> = this.operations.then(async (): Promise<void> => {
      if (!this.isCurrentSession(currentSession, generation) || !this.sessionActive) {
        return;
      }
      const playbackState = this.pendingPlaybackState;
      if (playbackState === undefined) {
        return;
      }
      this.pendingPlaybackState = undefined;
      await currentSession.setAVPlaybackState(playbackState);
    }).catch((error: Error): void => {
      Logger.warn(TAG, `Update AVSession state failed: ${JSON.stringify(error)}`);
    });
    this.operations = task;
  }

  private clearSession(): avSession.AVSession | undefined {
    const currentSession = this.session;
    this.session = undefined;
    this.sessionType = undefined;
    this.listenerRegistered = false;
    return currentSession;
  }

  stop(): Promise<void> {
    ++this.generation;
    this.callbacks = undefined;
    this.pendingPlaybackState = undefined;
    this.sessionActive = false;
    const task: Promise<void> = this.operations.then(async (): Promise<void> => {
      const currentSession = this.clearSession();
      if (currentSession !== undefined) {
        await this.destroySession(currentSession);
      }
    });
    this.operations = task;
    return task;
  }

  updateState(state: number, speed: number, positionUs: number, durationUs: number): void {
    const stateValue = this.toSessionState(state);
    const safePositionUs = Number.isFinite(positionUs) ? positionUs : 0;
    const safeDurationUs = Number.isFinite(durationUs) ? durationUs : 0;
    const safeSpeed = Number.isFinite(speed) && speed > 0 ? speed : 1;
    const safeDurationMs = Math.max(0, Math.round(safeDurationUs / 1000));
    const positionMs = Math.max(0, Math.round(safePositionUs / 1000));
    const safePositionMs = safeDurationMs > 0 ? Math.min(positionMs, safeDurationMs) : positionMs;
    const playbackState: avSession.AVPlaybackState = {
      state: stateValue,
      speed: safeSpeed,
      position: {
        elapsedTime: safePositionMs,
        updateTime: Date.now()
      },
      duration: safeDurationMs
    };
    this.pendingPlaybackState = playbackState;
    const currentSession = this.session;
    if (currentSession !== undefined && this.sessionActive) {
      this.queuePlaybackState(currentSession, this.generation);
    }
  }

  private async destroySession(currentSession: avSession.AVSession): Promise<void> {
    try {
      this.unregisterListeners(currentSession);
      await currentSession.setAVPlaybackState({ state: avSession.PlaybackState.PLAYBACK_STATE_STOP });
    } catch (error) {
      Logger.warn(TAG, `Set AVSession stopped state failed: ${JSON.stringify(error)}`);
    }
    try {
      await currentSession.deactivate();
    } catch (error) {
      Logger.warn(TAG, `Deactivate AVSession failed: ${JSON.stringify(error)}`);
    }
    try {
      await currentSession.destroy();
    } catch (error) {
      Logger.warn(TAG, `Destroy AVSession failed: ${JSON.stringify(error)}`);
    }
  }

  private registerListeners(currentSession: avSession.AVSession, generation: number): void {
    if (this.listenerRegistered) {
      this.unregisterListeners(currentSession);
      this.listenerRegistered = false;
    }
    this.bindListeners(currentSession, generation);
    // 任一监听注册失败时交由启动收尾销毁会话，避免激活不完整的媒体控件。
    currentSession.on('play', this.handlePlay);
    currentSession.on('pause', this.handlePause);
    currentSession.on('stop', this.handleStop);
    currentSession.on('playNext', this.handleNext);
    currentSession.on('playPrevious', this.handlePrevious);
    currentSession.on('fastForward', this.handleFastForward);
    currentSession.on('rewind', this.handleRewind);
    currentSession.on('seek', this.handleSeek);
    currentSession.on('setSpeed', this.handleSetSpeed);
    this.listenerRegistered = true;
  }

  private unregisterListeners(currentSession: avSession.AVSession): void {
    this.unregisterListener((): void => currentSession.off('play', this.handlePlay));
    this.unregisterListener((): void => currentSession.off('pause', this.handlePause));
    this.unregisterListener((): void => currentSession.off('stop', this.handleStop));
    this.unregisterListener((): void => currentSession.off('playNext', this.handleNext));
    this.unregisterListener((): void => currentSession.off('playPrevious', this.handlePrevious));
    this.unregisterListener((): void => currentSession.off('fastForward', this.handleFastForward));
    this.unregisterListener((): void => currentSession.off('rewind', this.handleRewind));
    this.unregisterListener((): void => currentSession.off('seek', this.handleSeek));
    this.unregisterListener((): void => currentSession.off('setSpeed', this.handleSetSpeed));
  }

  private unregisterListener(unregister: () => void): void {
    try {
      unregister();
    } catch (error) {
      Logger.warn(TAG, `Unregister AVSession listener failed: ${JSON.stringify(error)}`);
    }
  }

  private async setLaunchAbility(context: common.UIAbilityContext, generation: number): Promise<void> {
    const currentSession = this.session;
    if (currentSession === undefined || generation !== this.generation) {
      return;
    }
    try {
      const wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [{
          bundleName: context.abilityInfo.bundleName,
          abilityName: context.abilityInfo.name
        }],
        operationType: wantAgent.OperationType.START_ABILITIES,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
      const agent = await wantAgent.getWantAgent(wantAgentInfo);
      if (generation === this.generation && this.session === currentSession) {
        await currentSession.setLaunchAbility(agent);
      }
    } catch (error) {
      Logger.warn(TAG, `Set AVSession launch ability failed: ${JSON.stringify(error)}`);
    }
  }

  private handlePlay: () => void = (): void => {};
  private handlePause: () => void = (): void => {};
  private handleStop: () => void = (): void => {};
  private handleNext: () => void = (): void => {};
  private handlePrevious: () => void = (): void => {};
  private handleFastForward: (seconds?: number) => void = (): void => {};
  private handleRewind: (seconds?: number) => void = (): void => {};
  private handleSeek: (positionMs: number) => void = (): void => {};
  private handleSetSpeed: (speed: number) => void = (): void => {};

  private sessionCallbacks(currentSession: avSession.AVSession, generation: number):
    PlaybackSessionCallbacks | undefined {
    return this.isCurrentSession(currentSession, generation) ? this.callbacks : undefined;
  }

  private bindListeners(currentSession: avSession.AVSession, generation: number): void {
    this.handlePlay = (): void => {
      this.sessionCallbacks(currentSession, generation)?.onPlay();
    };
    this.handlePause = (): void => {
      this.sessionCallbacks(currentSession, generation)?.onPause();
    };
    this.handleStop = (): void => {
      this.sessionCallbacks(currentSession, generation)?.onStop();
    };
    this.handleNext = (): void => {
      this.sessionCallbacks(currentSession, generation)?.onNext();
    };
    this.handlePrevious = (): void => {
      this.sessionCallbacks(currentSession, generation)?.onPrevious();
    };
    this.handleFastForward = (seconds?: number): void => {
      this.sessionCallbacks(currentSession, generation)?.onFastForward(this.normalizeSkip(seconds));
    };
    this.handleRewind = (seconds?: number): void => {
      this.sessionCallbacks(currentSession, generation)?.onRewind(this.normalizeSkip(seconds));
    };
    this.handleSeek = (positionMs: number): void => {
      if (Number.isFinite(positionMs) && positionMs >= 0) {
        this.sessionCallbacks(currentSession, generation)?.onSeek(positionMs);
      }
    };
    this.handleSetSpeed = (speed: number): void => {
      if (Number.isFinite(speed) && speed > 0) {
        this.sessionCallbacks(currentSession, generation)?.onSetSpeed(speed);
      }
    };
  }

  private normalizeSkip(seconds: number | undefined): number {
    if (seconds === undefined || !Number.isFinite(seconds) || seconds <= 0) {
      return DEFAULT_SKIP_SECONDS;
    }
    return seconds;
  }

  private toSessionState(state: number): avSession.PlaybackState {
    if (state === 3) {
      return avSession.PlaybackState.PLAYBACK_STATE_PLAY;
    }
    if (state === 6) {
      return avSession.PlaybackState.PLAYBACK_STATE_PAUSE;
    }
    if (state === 4) {
      return avSession.PlaybackState.PLAYBACK_STATE_STOP;
    }
    if (state === 1 || state === 2 || state === 5) {
      return avSession.PlaybackState.PLAYBACK_STATE_PREPARE;
    }
    return avSession.PlaybackState.PLAYBACK_STATE_INITIAL;
  }

  private getQueueAssetId(index: number, count: number): string | undefined {
    return index >= 0 && index < count ? `queue-${index}` : undefined;
  }

  private createQueueItems(titles: string[]): avSession.AVQueueItem[] {
    const items: avSession.AVQueueItem[] = [];
    titles.forEach((title: string, index: number): void => {
      items.push({
        itemId: index,
        description: {
          assetId: `queue-${index}`,
          title: title
        }
      });
    });
    return items;
  }
}
