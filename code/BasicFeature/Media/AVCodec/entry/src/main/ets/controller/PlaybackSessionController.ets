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
  private stopTask: Promise<void> | undefined = undefined;
  // AVSession 未激活时暂存最新播放状态，激活后再同步给系统媒体控件。
  private pendingPlaybackState: avSession.AVPlaybackState | undefined = undefined;

  async start(context: common.UIAbilityContext, media: PlaybackSessionMedia,
    callbacks: PlaybackSessionCallbacks): Promise<void> {
    const currentGeneration = ++this.generation;
    const requiredSessionType: avSession.AVSessionType = media.hasVideo ? 'video' : 'audio';
    this.callbacks = callbacks;
    try {
      if (this.stopTask !== undefined) {
        await this.stopTask;
        if (currentGeneration !== this.generation) {
          return;
        }
        this.stopTask = undefined;
      }
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
      this.registerListeners(this.session);
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
      await this.session.setAVMetadata(metadata);
      if (currentGeneration !== this.generation || this.session === undefined) {
        return;
      }
      const queueItems: avSession.AVQueueItem[] = this.createQueueItems(media.queueTitles);
      if (queueItems.length > 0) {
        await this.session.setAVQueueItems(queueItems);
        await this.session.setAVQueueTitle(media.queueTitle);
      }
      if (currentGeneration !== this.generation || this.session === undefined) {
        return;
      }
      await this.setLaunchAbility(context, currentGeneration);
      if (currentGeneration !== this.generation || this.session === undefined) {
        return;
      }
      await this.session.activate();
      if (currentGeneration !== this.generation || this.session === undefined) {
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
      await this.session.setAVPlaybackState(initialState);
    } catch (error) {
      Logger.error(TAG, `Start AVSession failed: ${JSON.stringify(error)}`);
    }
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
    if (currentSession === undefined) {
      return;
    }
    currentSession.setAVPlaybackState(playbackState).catch((error: Error) => {
      Logger.warn(TAG, `Update AVSession state failed: ${JSON.stringify(error)}`);
    });
  }

  async stop(): Promise<void> {
    ++this.generation;
    if (this.stopTask !== undefined) {
      await this.stopTask;
      return;
    }
    const currentSession = this.session;
    this.session = undefined;
    this.sessionType = undefined;
    this.callbacks = undefined;
    this.listenerRegistered = false;
    this.pendingPlaybackState = undefined;
    if (currentSession === undefined) {
      return;
    }
    const cleanupTask: Promise<void> = this.destroySession(currentSession);
    this.stopTask = cleanupTask;
    await cleanupTask;
    if (this.stopTask === cleanupTask) {
      this.stopTask = undefined;
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

  private registerListeners(currentSession: avSession.AVSession): void {
    if (this.listenerRegistered) {
      return;
    }
    try {
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
    } catch (error) {
      Logger.warn(TAG, `Register AVSession listeners failed: ${JSON.stringify(error)}`);
    }
  }

  private unregisterListeners(currentSession: avSession.AVSession): void {
    try {
      currentSession.off('play', this.handlePlay);
      currentSession.off('pause', this.handlePause);
      currentSession.off('stop', this.handleStop);
      currentSession.off('playNext', this.handleNext);
      currentSession.off('playPrevious', this.handlePrevious);
      currentSession.off('fastForward', this.handleFastForward);
      currentSession.off('rewind', this.handleRewind);
      currentSession.off('seek', this.handleSeek);
      currentSession.off('setSpeed', this.handleSetSpeed);
    } catch (error) {
      Logger.warn(TAG, `Unregister AVSession listeners failed: ${JSON.stringify(error)}`);
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

  private handlePlay: () => void = (): void => {
    this.callbacks?.onPlay();
  };

  private handlePause: () => void = (): void => {
    this.callbacks?.onPause();
  };

  private handleStop: () => void = (): void => {
    this.callbacks?.onStop();
  };

  private handleNext: () => void = (): void => {
    this.callbacks?.onNext();
  };

  private handlePrevious: () => void = (): void => {
    this.callbacks?.onPrevious();
  };

  private handleFastForward: (seconds?: number) => void = (seconds?: number): void => {
    this.callbacks?.onFastForward(this.normalizeSkip(seconds));
  };

  private handleRewind: (seconds?: number) => void = (seconds?: number): void => {
    this.callbacks?.onRewind(this.normalizeSkip(seconds));
  };

  private handleSeek: (positionMs: number) => void = (positionMs: number): void => {
    if (Number.isFinite(positionMs) && positionMs >= 0) {
      this.callbacks?.onSeek(positionMs);
    }
  };

  private handleSetSpeed: (speed: number) => void = (speed: number): void => {
    if (Number.isFinite(speed) && speed > 0) {
      this.callbacks?.onSetSpeed(speed);
    }
  };

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
