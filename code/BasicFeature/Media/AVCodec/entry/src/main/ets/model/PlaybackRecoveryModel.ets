/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

export interface PlaybackRecoverySnapshot {
  positionUs: number;
  speed: number;
  paused: boolean;
}

export enum PlaybackRecoveryReason {
  NONE = 0,
  RUNTIME_ERROR = 1
}

export enum PlaybackRecoveryStatus {
  IDLE = 0,
  PENDING = 1,
  SUCCEEDED = 2,
  FAILED = 3
}

export class PlaybackRecoveryModel {
  private attempts: number = 0;
  private cancelled: boolean = false;
  private snapshot: PlaybackRecoverySnapshot | undefined = undefined;

  reset(): void {
    this.attempts = 0;
    this.cancelled = false;
    this.snapshot = undefined;
  }

  observe(positionUs: number, speed: number, paused: boolean, hasOutput: boolean): void {
    if (!this.cancelled && hasOutput && positionUs >= 0) {
      this.snapshot = { positionUs: positionUs, speed: speed, paused: paused };
    }
  }

  cancel(): void {
    this.cancelled = true;
  }

  takeRetry(): PlaybackRecoverySnapshot | undefined {
    if (this.cancelled || this.attempts > 0 || this.snapshot === undefined) {
      return undefined;
    }
    this.attempts++;
    return this.snapshot;
  }

  getAttemptCount(): number {
    return this.attempts;
  }
}
