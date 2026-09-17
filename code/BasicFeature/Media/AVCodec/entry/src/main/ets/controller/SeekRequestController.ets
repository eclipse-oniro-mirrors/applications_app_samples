/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

export type SeekRequestResult = 'completed' | 'superseded' | 'cancelled' | 'failed';

interface SeekRequest {
  targetUs: number;
  generation: number;
  resolve: (result: SeekRequestResult) => void;
}

const SEEK_SETTLE_MS: number = 100;

export class SeekRequestController {
  private pending: SeekRequest | undefined = undefined;
  private active: boolean = false;
  private generation: number = 0;
  private timer: number = 0;
  private idleCallbacks: (() => void)[] = [];
  public submitted: number = 0;
  public merged: number = 0;
  public completed: number = 0;
  public lastDurationMs: number = 0;

  private execute: (targetUs: number) => Promise<boolean>;

  constructor(execute: (targetUs: number) => Promise<boolean>) {
    this.execute = execute;
  }

  isBusy(): boolean {
    return this.active || this.pending !== undefined;
  }

  request(targetUs: number): Promise<SeekRequestResult> {
    this.submitted++;
    if (this.pending !== undefined) {
      this.pending.resolve('superseded');
      this.merged++;
    }
    const result = new Promise<SeekRequestResult>((resolve) => {
      this.pending = { targetUs: targetUs, generation: this.generation, resolve: resolve };
    });
    if (!this.active) {
      if (this.timer !== 0) {
        clearTimeout(this.timer);
      }
      this.timer = setTimeout(() => {
        this.timer = 0;
        this.drain();
      }, SEEK_SETTLE_MS);
    }
    return result;
  }

  // A running codec rebuild must finish before stop or a new playback task.
  cancel(): void {
    this.generation++;
    if (this.timer !== 0) {
      clearTimeout(this.timer);
      this.timer = 0;
    }
    this.pending?.resolve('cancelled');
    this.pending = undefined;
    this.notifyIdle();
  }

  waitForIdle(): Promise<void> {
    return new Promise<void>((resolve) => {
      if (!this.isBusy()) {
        resolve();
      } else {
        this.idleCallbacks.push(resolve);
      }
    });
  }

  resetStatistics(): void {
    this.submitted = 0;
    this.merged = 0;
    this.completed = 0;
    this.lastDurationMs = 0;
  }

  private async drain(): Promise<void> {
    if (this.active || this.pending === undefined) {
      return;
    }
    const request = this.pending;
    this.pending = undefined;
    this.active = true;
    const startMs = Date.now();
    let success: boolean = false;
    try {
      success = await this.execute(request.targetUs);
    } catch (error) {
      success = false;
    }
    this.lastDurationMs = Math.max(0, Date.now() - startMs);
    this.active = false;
    if (request.generation === this.generation) {
      if (success) {
        this.completed++;
      }
      request.resolve(success ? 'completed' : 'failed');
    } else {
      request.resolve('cancelled');
    }
    if (this.pending !== undefined) {
      this.drain();
    } else {
      this.notifyIdle();
    }
  }

  private notifyIdle(): void {
    if (this.isBusy()) {
      return;
    }
    const callbacks = this.idleCallbacks;
    this.idleCallbacks = [];
    callbacks.forEach((callback: () => void) => callback());
  }
}
