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

/**
 * Shared pure-domain models for the MediaFullScreen test suite.
 * They mirror the behaviour of entry/src/main/ets (AVPlayer state machine,
 * fullscreen/orientation switching, immersive window configuration, the
 * waterfall data source and the time formatter) so test cases can validate
 * the same rules without the real rendering pipeline or a video decoder.
 */

export enum MediaState {
  IDLE = 'idle',
  INITIALIZED = 'initialized',
  PREPARED = 'prepared',
  PLAYING = 'playing',
  PAUSED = 'paused',
  COMPLETED = 'completed',
  STOPPED = 'stopped',
  RELEASED = 'released',
  ERROR = 'error'
}

export enum ScreenOrientation {
  PORTRAIT = 'portrait',
  LANDSCAPE = 'landscape',
  AUTO_LANDSCAPE = 'auto_landscape',
  UNSPECIFIED = 'unspecified'
}

export enum SystemBarMode {
  NONE = 'none',
  STATUS = 'status',
  NAVIGATION = 'navigation',
  BOTH = 'both'
}

export interface SpeedOption {
  text: string;
  value: number;
  multiplier: number;
}

export interface PlayerSnapshot {
  state: MediaState;
  positionMs: number;
  durationMs: number;
  speedMultiplier: number;
}

export const SPEED_OPTIONS: SpeedOption[] = [
  { text: '0.75x', value: 0, multiplier: 0.75 },
  { text: '1.0x', value: 1, multiplier: 1.0 },
  { text: '1.25x', value: 2, multiplier: 1.25 },
  { text: '1.75x', value: 3, multiplier: 1.75 },
  { text: '2.0x', value: 4, multiplier: 2.0 }
];

export const DEFAULT_SPEED_INDEX: number = 1;
export const VIDEO_ASPECT_RATIO: number = 1.77777778;
export const MAX_HOURS: number = 24;
export const HOUR_MS: number = 3600000;
export const MINUTE_MS: number = 60000;
export const SECOND_MS: number = 1000;

/**
 * Time formatter mirroring entry/src/main/ets/util/TimeTools.ts.
 * Negative or NaN input is treated as zero. Hours are emitted only when
 * greater than zero, otherwise output stays in mm:ss form.
 */
export class TimeFormatter {
  public static fillNum(num: number): string {
    if (num < 10) {
      return '0' + num.toString();
    }
    return num.toString();
  }

  public static normalize(time: number): number {
    if (time === undefined || time === null) {
      return 0;
    }
    if (isNaN(time) || time < 0) {
      return 0;
    }
    return Math.floor(time);
  }

  public static format(time: number): string {
    const normalized: number = TimeFormatter.normalize(time);
    const hour: number = Math.floor(normalized % (HOUR_MS * MAX_HOURS) / HOUR_MS);
    const minute: number = Math.floor(normalized % HOUR_MS / MINUTE_MS);
    const second: number = Math.floor(normalized % MINUTE_MS / SECOND_MS);
    if (hour > 0) {
      return TimeFormatter.fillNum(hour) + ':' + TimeFormatter.fillNum(minute) + ':' +
        TimeFormatter.fillNum(second);
    }
    return TimeFormatter.fillNum(minute) + ':' + TimeFormatter.fillNum(second);
  }
}

/**
 * AVPlayer state machine mirroring the callbacks used by XVideoComponent.
 */
export class VideoPlayerModel {
  private state: MediaState = MediaState.IDLE;
  private durationMs: number = 0;
  private positionMs: number = 0;
  private speedIndex: number = DEFAULT_SPEED_INDEX;
  private errorCode: number = 0;
  private errorMessage: string = '';

  public getState(): MediaState {
    return this.state;
  }

  public getDuration(): number {
    return this.durationMs;
  }

  public getPosition(): number {
    return this.positionMs;
  }

  public getSpeedIndex(): number {
    return this.speedIndex;
  }

  public getSpeedMultiplier(): number {
    if (this.speedIndex < 0 || this.speedIndex >= SPEED_OPTIONS.length) {
      return SPEED_OPTIONS[DEFAULT_SPEED_INDEX].multiplier;
    }
    return SPEED_OPTIONS[this.speedIndex].multiplier;
  }

  public getErrorCode(): number {
    return this.errorCode;
  }

  public getErrorMessage(): string {
    return this.errorMessage;
  }

  public snapshot(): PlayerSnapshot {
    return {
      state: this.state,
      positionMs: this.positionMs,
      durationMs: this.durationMs,
      speedMultiplier: this.getSpeedMultiplier()
    };
  }

  public initialize(): boolean {
    if (this.state !== MediaState.IDLE) {
      return false;
    }
    this.state = MediaState.INITIALIZED;
    return true;
  }

  public prepare(durationMs: number): boolean {
    if (this.state !== MediaState.IDLE && this.state !== MediaState.INITIALIZED) {
      return false;
    }
    if (durationMs < 0) {
      return false;
    }
    this.durationMs = durationMs;
    this.positionMs = 0;
    this.state = MediaState.PREPARED;
    return true;
  }

  public play(): boolean {
    if (this.state === MediaState.PREPARED || this.state === MediaState.PAUSED) {
      this.state = MediaState.PLAYING;
      return true;
    }
    if (this.state === MediaState.COMPLETED) {
      this.positionMs = 0;
      this.state = MediaState.PLAYING;
      return true;
    }
    return false;
  }

  public pause(): boolean {
    if (this.state !== MediaState.PLAYING) {
      return false;
    }
    this.state = MediaState.PAUSED;
    return true;
  }

  public stop(): boolean {
    if (this.state === MediaState.PLAYING || this.state === MediaState.PAUSED ||
      this.state === MediaState.PREPARED) {
      this.state = MediaState.STOPPED;
      this.positionMs = 0;
      return true;
    }
    return false;
  }

  public release(): boolean {
    if (this.state === MediaState.RELEASED) {
      return false;
    }
    this.state = MediaState.RELEASED;
    this.positionMs = 0;
    return true;
  }

  public canSeek(): boolean {
    return this.state === MediaState.PREPARED || this.state === MediaState.PLAYING ||
      this.state === MediaState.PAUSED || this.state === MediaState.COMPLETED;
  }

  public seek(positionMs: number): boolean {
    if (!this.canSeek()) {
      return false;
    }
    if (this.durationMs <= 0) {
      this.positionMs = 0;
      return true;
    }
    if (positionMs < 0) {
      this.positionMs = 0;
    } else if (positionMs > this.durationMs) {
      this.positionMs = this.durationMs;
    } else {
      this.positionMs = Math.floor(positionMs);
    }
    return true;
  }

  public setSpeedByIndex(index: number): boolean {
    if (this.state !== MediaState.PLAYING && this.state !== MediaState.PAUSED) {
      return false;
    }
    if (index < 0 || index >= SPEED_OPTIONS.length) {
      return false;
    }
    this.speedIndex = index;
    return true;
  }

  public tick(deltaMs: number): void {
    if (this.state !== MediaState.PLAYING || deltaMs <= 0) {
      return;
    }
    const scaled: number = Math.floor(deltaMs * this.getSpeedMultiplier());
    this.positionMs = this.positionMs + scaled;
    if (this.durationMs > 0 && this.positionMs >= this.durationMs) {
      this.positionMs = this.durationMs;
      this.state = MediaState.COMPLETED;
    }
  }

  public markError(code: number, message: string): void {
    this.state = MediaState.ERROR;
    this.errorCode = code;
    this.errorMessage = message;
  }
}

/**
 * Fullscreen / orientation controller mirroring MediaFullScreen.ets and
 * XVideoComponent.ets. Selecting a video shows the mask, a prepared player
 * flips to landscape, and back press exits the playback before the page.
 */
export class FullscreenModel {
  private isLandscape: boolean = false;
  private isFullScreen: boolean = false;
  private maskShow: boolean = false;
  private selectedVideo: string = '';
  private orientation: ScreenOrientation = ScreenOrientation.PORTRAIT;

  public getIsLandscape(): boolean {
    return this.isLandscape;
  }

  public getIsFullScreen(): boolean {
    return this.isFullScreen;
  }

  public getMaskShow(): boolean {
    return this.maskShow;
  }

  public getSelectedVideo(): string {
    return this.selectedVideo;
  }

  public getOrientation(): ScreenOrientation {
    return this.orientation;
  }

  public selectVideo(video: string): boolean {
    if (this.selectedVideo !== '' || video === '') {
      return false;
    }
    this.selectedVideo = video;
    this.maskShow = true;
    return true;
  }

  public onPrepared(): boolean {
    if (this.selectedVideo === '') {
      return false;
    }
    this.isFullScreen = true;
    this.isLandscape = true;
    this.orientation = ScreenOrientation.AUTO_LANDSCAPE;
    return true;
  }

  public toggleOrientation(): boolean {
    if (this.selectedVideo === '') {
      return false;
    }
    this.isLandscape = !this.isLandscape;
    this.isFullScreen = !this.isFullScreen;
    this.orientation = this.isLandscape ? ScreenOrientation.AUTO_LANDSCAPE : ScreenOrientation.UNSPECIFIED;
    if (!this.isLandscape) {
      this.selectedVideo = '';
      this.maskShow = false;
    }
    return true;
  }

  public exitPlayback(): boolean {
    if (this.selectedVideo === '') {
      return false;
    }
    this.isLandscape = false;
    this.isFullScreen = false;
    this.maskShow = false;
    this.selectedVideo = '';
    this.orientation = ScreenOrientation.PORTRAIT;
    return true;
  }

  public onBackPress(): boolean {
    if (this.selectedVideo !== '') {
      this.exitPlayback();
      return true;
    }
    return false;
  }
}

/**
 * Immersive window configuration mirroring the @ohos.window calls executed
 * from XVideoComponent.changeOrientation.
 */
export class WindowConfigModel {
  private layoutFullScreen: boolean = false;
  private bars: SystemBarMode = SystemBarMode.BOTH;

  public getLayoutFullScreen(): boolean {
    return this.layoutFullScreen;
  }

  public getBars(): SystemBarMode {
    return this.bars;
  }

  public enterImmersive(): void {
    this.layoutFullScreen = true;
    this.bars = SystemBarMode.NONE;
  }

  public exitImmersive(): void {
    this.layoutFullScreen = false;
    this.bars = SystemBarMode.BOTH;
  }

  public applyLandscape(): void {
    this.enterImmersive();
  }

  public restorePortrait(): void {
    this.exitImmersive();
  }
}

/**
 * Waterfall item and data source mirroring BasicDataSource.ets.
 */
export class FlowItemModel {
  public id: string;
  public userId: string;
  public userName: string;
  public text: string;
  public media: string;
  public mediaPreview: string;

  constructor(id: string, userId: string, userName: string, text: string, media: string, mediaPreview: string) {
    this.id = id;
    this.userId = userId;
    this.userName = userName;
    this.text = text;
    this.media = media;
    this.mediaPreview = mediaPreview;
  }

  public toString(): string {
    return this.id + '  ' + this.userId + '  ' + this.userName + '  ' + this.text;
  }

  public isValid(): boolean {
    return this.id !== '' && this.userName !== '' && this.media !== '' && this.mediaPreview !== '';
  }
}

export class FlowDataSource {
  private items: FlowItemModel[] = [];
  private addNotifications: number = 0;
  private reloadNotifications: number = 0;
  private changeNotifications: number = 0;
  private deleteNotifications: number = 0;

  public totalCount(): number {
    return this.items.length;
  }

  public getData(index: number): FlowItemModel | undefined {
    if (index < 0 || index >= this.items.length) {
      return undefined;
    }
    return this.items[index];
  }

  public getAll(): FlowItemModel[] {
    return this.items;
  }

  public addData(index: number, data: FlowItemModel): boolean {
    if (index < 0 || index > this.items.length) {
      return false;
    }
    this.items.splice(index, 0, data);
    this.addNotifications++;
    return true;
  }

  public pushData(data: FlowItemModel): boolean {
    this.items.push(data);
    this.addNotifications++;
    return true;
  }

  public pushDataArray(data: FlowItemModel[]): number {
    for (let i = 0; i < data.length; i++) {
      this.items.push(data[i]);
    }
    this.addNotifications++;
    return data.length;
  }

  public removeData(index: number): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items.splice(index, 1);
    this.deleteNotifications++;
    return true;
  }

  public notifyReload(): void {
    this.reloadNotifications++;
  }

  public notifyChange(): void {
    this.changeNotifications++;
  }

  public getAddNotifications(): number {
    return this.addNotifications;
  }

  public getReloadNotifications(): number {
    return this.reloadNotifications;
  }

  public getChangeNotifications(): number {
    return this.changeNotifications;
  }

  public getDeleteNotifications(): number {
    return this.deleteNotifications;
  }
}

/**
 * Playback speed controller derived from the SPEED_OPTIONS popup list.
 */
export class PlaybackSpeedController {
  private index: number = DEFAULT_SPEED_INDEX;

  public getIndex(): number {
    return this.index;
  }

  public getText(): string {
    return SPEED_OPTIONS[this.index].text;
  }

  public getMultiplier(): number {
    return SPEED_OPTIONS[this.index].multiplier;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= SPEED_OPTIONS.length) {
      return false;
    }
    this.index = index;
    return true;
  }

  public next(): boolean {
    if (this.index >= SPEED_OPTIONS.length - 1) {
      return false;
    }
    this.index++;
    return true;
  }

  public previous(): boolean {
    if (this.index <= 0) {
      return false;
    }
    this.index--;
    return true;
  }
}

/**
 * Slider seek math mirroring the XComponentVideo slider onChange handler.
 */
export class SeekController {
  public static percentToTime(percent: number, durationMs: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    if (percent < 0) {
      percent = 0;
    }
    if (percent > 100) {
      percent = 100;
    }
    return Math.round(durationMs * percent / 100);
  }

  public static timeToPercent(timeMs: number, durationMs: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    const percent: number = timeMs / durationMs * 100;
    if (percent < 0) {
      return 0;
    }
    if (percent > 100) {
      return 100;
    }
    return percent;
  }
}

/**
 * Aspect ratio helpers mirroring the ASPECT_RATIO usage in the sample.
 */
export class AspectRatioUtil {
  public static widthForHeight(height: number): number {
    return height * VIDEO_ASPECT_RATIO;
  }

  public static heightForWidth(width: number): number {
    return width / VIDEO_ASPECT_RATIO;
  }

  public static isLandscapeRatio(ratio: number): boolean {
    return ratio > 1;
  }

  public static isPortraitRatio(ratio: number): boolean {
    return ratio < 1;
  }

  public static isSquareRatio(ratio: number): boolean {
    return ratio === 1;
  }
}

/**
 * Session manager tracking AVPlayer creation/release as XVideoComponent does.
 */
export class VideoSessionManager {
  private active: number = 0;
  private created: number = 0;
  private released: number = 0;

  public create(): boolean {
    if (this.active > 0) {
      return false;
    }
    this.active++;
    this.created++;
    return true;
  }

  public release(): boolean {
    if (this.active <= 0) {
      return false;
    }
    this.active--;
    this.released++;
    return true;
  }

  public getActive(): number {
    return this.active;
  }

  public getCreated(): number {
    return this.created;
  }

  public getReleased(): number {
    return this.released;
  }

  public isIdle(): boolean {
    return this.active === 0;
  }
}

/**
 * Buffering state mirroring the AVPlayer bufferingUpdate callback.
 */
export interface BufferInfo {
  infoType: number;
  value: number;
}

export class BufferStateModel {
  private buffering: boolean = false;
  private lastPercent: number = 0;
  private updates: number = 0;

  public onBufferingStart(): void {
    this.buffering = true;
    this.lastPercent = 0;
    this.updates++;
  }

  public onBufferingUpdate(percent: number): void {
    if (percent < 0) {
      percent = 0;
    }
    if (percent > 100) {
      percent = 100;
    }
    this.lastPercent = percent;
    if (percent >= 100) {
      this.buffering = false;
    }
    this.updates++;
  }

  public onBufferingEnd(): void {
    this.buffering = false;
  }

  public isBuffering(): boolean {
    return this.buffering;
  }

  public getLastPercent(): number {
    return this.lastPercent;
  }

  public getUpdates(): number {
    return this.updates;
  }
}

/**
 * Error severity helper mirroring AVPlayer on('error') handling.
 */
export class PlayerErrorModel {
  private code: number = 0;
  private message: string = '';
  private count: number = 0;

  public setError(code: number, message: string): void {
    this.code = code;
    this.message = message;
    this.count++;
  }

  public getCode(): number {
    return this.code;
  }

  public getMessage(): string {
    return this.message;
  }

  public getCount(): number {
    return this.count;
  }

  public isFatal(): boolean {
    return this.code !== 0;
  }

  public describe(): string {
    return 'Error ' + this.code.toString() + ' - ' + this.message;
  }
}


