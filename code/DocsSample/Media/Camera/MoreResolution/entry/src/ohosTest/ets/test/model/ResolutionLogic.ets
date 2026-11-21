/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Deterministic transcription of the MoreResolution sample behaviour. Camera hardware,
// XComponent, display, fold status and media saving are replaced by explicit inputs so
// every resolution decision and page callback has one reproducible result.

// Mirrors Constants.ets.
export const X_COMPONENT_SURFACE_HEIGHT: number = 720;
export const X_COMPONENT_SURFACE_WIDTH: number = 1280;
export const X_COMPONENT_BORDER_WIDTH: number = 0.5;
export const CAPTURE_BUTTON_BORDER_WIDTH: number = 3;
export const CAPTURE_BUTTON_BORDER_RADIUS: number = 70;
export const CAPTURE_BUTTON_COLUMN_MARGIN: number = 24;
export const CAPTURE_BUTTON_COLUMN_PADDING: number = 24;
export const BACK_ICON_SIZE: number = 24;
export const IMAGE_SIZE: number = 25;
export const BACK_ICON_MARGIN: number = 24;
export const FULL_PERCENT: string = '100%';
export const EIGHTY_FIVE_PERCENT: string = '85%';
export const EIGHTY_PERCENT: string = '80%';
export const SEVENTY_FIVE_PERCENT: string = '75%';
export const SEVENTY_PERCENT: string = '70%';
export const FORTY_PERCENT: string = '40%';
export const THIRTY_PERCENT: string = '30%';
export const FIFTEEN_PERCENT: string = '15%';
export const TEN_PERCENT: string = '10%';
export const ZERO_PERCENT: string = '0%';
export const TEXT_BORDER_RADIUS: number = 25;
export const FONT_SIZE_14: number = 14;
export const COLUMN_SPACE_24: number = 24;
export const ROW_SPACE_24: number = 24;
export const DEFAULT_ZOOM_RATIO: number = 1;
export const BORDER_RADIUS_14: number = 14;
export const CAPTURE_COLUMN_WIDTH: number = 50;
export const CAPTURE_ROW_HEIGHT: number = 28;
export const AUDIO_BITRATE: number = 48000;
export const AUDIO_CHANNELS: number = 2;
export const AUDIO_SAMPLE_RATE: number = 48000;
export const VIDEO_BITRATE: number = 8000000;
export const MAX_VIDEO_FRAME: number = 60;
export const EDIT_PAGE_NAME: string = 'EditPage';

// Mirrors the CameraService profiles.
export const PREVIEW_FORMAT: number = 1003;
export const PHOTO_FORMAT: number = 2000;
export const VIDEO_FORMAT: number = 1003;
export const DEFAULT_PHOTO_WIDTH: number = 1920;
export const DEFAULT_PHOTO_HEIGHT: number = 1080;
export const DEFAULT_PREVIEW_WIDTH: number = 1280;
export const DEFAULT_PREVIEW_HEIGHT: number = 720;
export const DEFAULT_VIDEO_WIDTH: number = 1280;
export const DEFAULT_VIDEO_HEIGHT: number = 720;
export const VIDEO_FRAME_MIN: number = 30;
export const VIDEO_FRAME_MAX: number = 60;

// Mirrors camera.SceneMode / camera.CameraPosition values used by the sample.
export const SCENE_NORMAL_PHOTO: number = 1;
export const SCENE_NORMAL_VIDEO: number = 2;
export const POSITION_UNSPECIFIED: number = 0;
export const POSITION_BACK: number = 1;
export const POSITION_FRONT: number = 2;

// Mirrors the resolution Select options in Index.ets.
export const DEFAULT_RESOLUTION_INDEX: number = 8;
export const RESOLUTION_COUNT: number = 16;
export const FULL_MODE_INDEX: number = 0;
export const SQUARE_MODE_INDEX: number = 1;
export const WIDE_MODE_INDEX: number = 2;
export const ZOOM_RADIO_MAX: number = 6;
export const ZOOM_RADIO_MAX_STEP: number = 0.1;
export const ZOOM_RADIO_MIN_STEP: number = 0.01;
export const FRACTION_DIGITS: number = 2;
export const FALLBACK_RECONFIG_HEIGHT: number = 720;
export const RATIO_TOLERANCE: number = 0.2;
export const TARGET_VERSION_LIMIT: number = 50000013;

// Mirrors display.FoldStatus values used by the sample.
export const FOLD_UNKNOWN: number = 0;
export const FOLD_EXPANDED: number = 1;
export const FOLD_FOLDED: number = 2;
export const FOLD_HALF_FOLDED: number = 3;

export function round6(value: number): number {
  return Math.round(value * 1000000) / 1000000;
}

export function normalizeDegree(value: number): number {
  return ((value % 360) + 360) % 360;
}

export class ResolutionOption {
  public value: string = '';
  public width: number = 0;
  public height: number = 0;

  constructor(value: string, width: number, height: number) {
    this.value = value;
    this.width = width;
    this.height = height;
  }
}

export class SizeInfo {
  public width: number = 0;
  public height: number = 0;

  constructor(width: number, height: number) {
    this.width = width;
    this.height = height;
  }
}

export class Profile {
  public width: number = 0;
  public height: number = 0;
  public format: number = 0;
  public minFrame: number = 0;
  public maxFrame: number = 0;

  constructor(width: number, height: number, format: number, minFrame: number, maxFrame: number) {
    this.width = width;
    this.height = height;
    this.format = format;
    this.minFrame = minFrame;
    this.maxFrame = maxFrame;
  }
}

export function resolutionWidth(index: number): number {
  if (index === 0) { return 4096; }
  if (index === 1) { return 4096; }
  if (index === 2) { return 3840; }
  if (index === 3) { return 2880; }
  if (index === 4) { return 2560; }
  if (index === 5) { return 2408; }
  if (index === 6) { return 2384; }
  if (index === 7) { return 1920; }
  if (index === 8) { return 1920; }
  if (index === 9) { return 1440; }
  if (index === 10) { return 1280; }
  if (index === 11) { return 1088; }
  if (index === 12) { return 1080; }
  if (index === 13) { return 720; }
  if (index === 14) { return 640; }
  if (index === 15) { return 480; }
  return -1;
}

export function resolutionHeight(index: number): number {
  if (index === 0) { return 3072; }
  if (index === 1) { return 2304; }
  if (index === 2) { return 2160; }
  if (index === 3) { return 2160; }
  if (index === 4) { return 1440; }
  if (index === 5) { return 1080; }
  if (index === 6) { return 1080; }
  if (index === 7) { return 1440; }
  if (index === 8) { return 1080; }
  if (index === 9) { return 1080; }
  if (index === 10) { return 720; }
  if (index === 11) { return 1088; }
  if (index === 12) { return 1080; }
  if (index === 13) { return 720; }
  if (index === 14) { return 480; }
  if (index === 15) { return 480; }
  return -1;
}

export function resolutionLabel(index: number): string {
  const width: number = resolutionWidth(index);
  const height: number = resolutionHeight(index);
  if (width < 0 || height < 0) { return ''; }
  return width + '*' + height;
}

export function resolutionCount(): number {
  return RESOLUTION_COUNT;
}

export function defaultResolutionIndex(): number {
  return DEFAULT_RESOLUTION_INDEX;
}

export function validResolutionIndex(index: number): boolean {
  return index >= 0 && index < RESOLUTION_COUNT;
}

export function findResolutionIndex(width: number, height: number): number {
  for (let i: number = 0; i < RESOLUTION_COUNT; i++) {
    if (resolutionWidth(i) === width && resolutionHeight(i) === height) {
      return i;
    }
  }
  return -1;
}

export function resolutionRatio(index: number): number {
  const width: number = resolutionWidth(index);
  const height: number = resolutionHeight(index);
  if (width < 0 || height <= 0) { return 0; }
  return round6(width / height);
}

export function changeResolutionIndex(current: number, next: number): number {
  return validResolutionIndex(next) ? next : current;
}

export function profileFormat(kind: number): number {
  if (kind === 1) { return PHOTO_FORMAT; }
  if (kind === 2) { return VIDEO_FORMAT; }
  return PREVIEW_FORMAT;
}

export function profileMatchesSize(profile: Profile, width: number, height: number): boolean {
  return profile.width === width && profile.height === height;
}

export function profileMatchesFormat(profile: Profile, format: number): boolean {
  return profile.format === format;
}

export function videoFrameAllowed(min: number, max: number): boolean {
  return min <= MAX_VIDEO_FRAME && max <= MAX_VIDEO_FRAME;
}

// Mirrors getPreviewProfile(): the largest preview whose ratio is within 0.2 of the
// requested ratio; otherwise the profile whose height is closest to 720.
export function selectPreviewProfileIndex(profiles: Array<Profile>, configRatio: number,
  format: number, fallbackHeight: number): number {
  let optimal: number = -1;
  let lastHeight: number = 0;
  for (let i: number = 0; i < profiles.length; i++) {
    if (profiles[i].format !== format) {
      continue;
    }
    const ratio: number = profiles[i].width / profiles[i].height;
    if (Math.abs(ratio - configRatio) > RATIO_TOLERANCE) {
      continue;
    }
    if (profiles[i].height >= lastHeight) {
      optimal = i;
      lastHeight = profiles[i].height;
    }
  }
  if (optimal !== -1) {
    return optimal;
  }
  let minDiff: number = Number.MAX_VALUE;
  for (let i: number = 0; i < profiles.length; i++) {
    if (profiles[i].format !== format) {
      continue;
    }
    const diff: number = Math.abs(profiles[i].height - fallbackHeight);
    if (diff < minDiff) {
      minDiff = diff;
      optimal = i;
    }
  }
  return optimal;
}

// Mirrors getPreviewProfile2()/getPhotoProfile2()/getVideoProfile2().
export function selectExactProfileIndex(profiles: Array<Profile>, width: number, height: number): number {
  for (let i: number = 0; i < profiles.length; i++) {
    if (profiles[i].width === width && profiles[i].height === height) {
      return i;
    }
  }
  return -1;
}

export function selectPhotoProfileIndex(profiles: Array<Profile>, width: number, height: number): number {
  return selectExactProfileIndex(profiles, width, height);
}

export function selectVideoProfileIndex(profiles: Array<Profile>, width: number, height: number): number {
  return selectExactProfileIndex(profiles, width, height);
}

// Mirrors selectProfileForPreviewAndVideo2().
export class ProfileSelectionResult {
  public status: string = '';
  public videoIndex: number = -1;
  public previewIndex: number = -1;
}

export function selectProfileForPreviewAndVideo(sceneMode: number, videoProfiles: Array<Profile>,
  previewProfiles: Array<Profile>, width: number, height: number): ProfileSelectionResult {
  const result: ProfileSelectionResult = new ProfileSelectionResult();
  if (sceneMode === SCENE_NORMAL_VIDEO) {
    const videoIndex: number = selectVideoProfileIndex(videoProfiles, width, height);
    if (videoIndex === -1) {
      result.status = 'video-not-support';
      return result;
    }
    result.videoIndex = videoIndex;
  }
  const previewIndex: number = selectExactProfileIndex(previewProfiles, width, height);
  if (previewIndex === -1) {
    result.status = 'preview-not-support';
    return result;
  }
  result.previewIndex = previewIndex;
  result.status = 'ok';
  return result;
}

// Mirrors selectCameraDevice().
export function selectCameraDeviceIndex(positions: Array<number>, position: number): number {
  for (let i: number = 0; i < positions.length; i++) {
    if (positions[i] === position) {
      return i;
    }
  }
  return -1;
}

export function sceneModeSupported(modes: Array<number>, mode: number): boolean {
  return modes.indexOf(mode) !== -1;
}

export function is2in1(deviceType: string): boolean {
  return deviceType === '2in1';
}

export function isIsolateForSpecialType(deviceType: string, targetVersion: number): boolean {
  return deviceType === 'tablet' && targetVersion <= TARGET_VERSION_LIMIT;
}

export function isTablet(deviceType: string): boolean {
  return deviceType === 'tablet';
}

export function configRatioForSelectedIndex(index: number): number {
  if (index === WIDE_MODE_INDEX) { return round6(16 / 9); }
  if (index === SQUARE_MODE_INDEX) { return 1; }
  return 0;
}

export function dynamicConfigRatio(windowWidth: number, windowHeight: number): number {
  if (windowWidth > windowHeight) {
    return round6(windowWidth / windowHeight);
  }
  return round6(windowHeight / windowWidth);
}

export function angleDiff(rotation: number, cameraOrientation: number): number {
  return normalizeDegree(rotation + cameraOrientation);
}

// Mirrors updateXcomponentSize(). selectedIndex 0 uses a profile-derived ratio.
export function xComponentSize(isTabletDevice: boolean, targetVersion: number, windowWidth: number,
  windowHeight: number, rotation: number, cameraOrientation: number, selectedIndex: number,
  configRatio: number): SizeInfo {
  let ratio: number = configRatio;
  if (selectedIndex === FULL_MODE_INDEX) {
    ratio = dynamicConfigRatio(windowWidth, windowHeight);
  }
  const diff: number = angleDiff(rotation, cameraOrientation);
  if (isIsolateForSpecialType(isTabletDevice ? 'tablet' : 'phone', targetVersion)) {
    if (diff === 90 || diff === 270) {
      return new SizeInfo(round6(ratio * windowHeight), windowHeight);
    }
    return new SizeInfo(windowWidth, round6(ratio * windowWidth));
  }
  if (diff === 90 || diff === 270) {
    return new SizeInfo(windowWidth, round6(ratio * windowWidth));
  }
  return new SizeInfo(round6(ratio * windowHeight), windowHeight);
}

export function updateRotationAngle(position: number): number {
  return position === POSITION_FRONT ? 180 : 0;
}

export function snapshotRotation(position: number): number {
  return position === POSITION_BACK ? 90 : 270;
}

// Mirrors saveToFile(): preview rotation plus the front-camera mirror compensation.
export function saveRotationInfo(position: number, previewRotation: number, displayRotation: number): string {
  let angle: number = previewRotation;
  const rotation: number = displayRotation * 90;
  let flip: boolean = false;
  if (position === POSITION_FRONT) {
    if (rotation === 90 || rotation === 270) {
      angle = (angle + 180) % 360;
    }
    flip = true;
  }
  return normalizeDegree(angle) + '|' + flip;
}

// Mirrors getRealData() for a gravity/accelerometer sample.
export function deviceDegree(x: number, y: number, z: number): number {
  if ((x * x + y * y) * 3 < z * z) {
    return 0;
  }
  const sd: number = Math.atan2(y, -x);
  const sc: number = Math.round(sd / 3.141592653589 * 180);
  const degree: number = 90 - sc;
  return normalizeDegree(degree);
}

export function switchCameraPosition(position: number): number {
  if (position === POSITION_BACK) { return POSITION_FRONT; }
  if (position === POSITION_FRONT) { return POSITION_BACK; }
  return POSITION_BACK;
}

export function modeSwitchNeedsReinit(current: number, next: number): boolean {
  return current !== next;
}

export function foldDeviceIndex(foldStatus: number, position: number, supportedPositions: Array<number>): number {
  if (foldStatus === FOLD_EXPANDED || foldStatus === FOLD_FOLDED) {
    return selectCameraDeviceIndex(supportedPositions, position);
  }
  return -1;
}

export function foldFallbackPosition(supportedPositions: Array<number>): number {
  return supportedPositions.length > 0 ? supportedPositions[0] : POSITION_UNSPECIFIED;
}

export function shouldUpdateFoldStatus(foldStatus: number): boolean {
  return foldStatus === FOLD_EXPANDED || foldStatus === FOLD_FOLDED;
}

export function shouldShowResolutionSelect(is2in1Device: boolean): boolean {
  return !is2in1Device;
}

export function updateSliderMin(range: Array<number>): number {
  return range.length > 0 ? range[0] : 1;
}

export function updateSliderMax(range: Array<number>): number {
  if (range.length < 2) { return ZOOM_RADIO_MAX; }
  return range[1] > ZOOM_RADIO_MAX ? ZOOM_RADIO_MAX : range[1];
}

export function sliderStep(max: number): number {
  return max > ZOOM_RADIO_MAX ? ZOOM_RADIO_MAX_STEP : ZOOM_RADIO_MIN_STEP;
}

export function zoomClamp(value: number, min: number, max: number): number {
  if (value < min) { return min; }
  if (value > max) { return max; }
  return value;
}

export function zoomRound(value: number): number {
  return Number(value.toFixed(FRACTION_DIGITS));
}

export function zoomLabel(value: number): string {
  return value + 'x';
}

export function editUsesPhoto(sceneMode: number): boolean {
  return sceneMode === SCENE_NORMAL_PHOTO;
}

export function editUsesVideo(sceneMode: number): boolean {
  return sceneMode === SCENE_NORMAL_VIDEO;
}

export function saveToastText(errCode: number): string {
  return errCode === 0 ? '保存成功' : '保存失败';
}

export function canStartVideo(recording: boolean, hasVideo: boolean): boolean {
  return hasVideo && !recording;
}

export function canStopVideo(recording: boolean): boolean {
  return recording;
}

export function firstRecordingAction(isFirstRecording: boolean): string {
  return isFirstRecording ? 'updateRotation' : 'prepareRecorder';
}

export function pageReloadToggle(flag: boolean): boolean {
  return !flag;
}

export function deleteVideoFileName(fileName: string): boolean {
  return fileName.length > 0;
}

export function cameraErrorIsFatal(code: number): boolean {
  return code === 7400101;
}

export function routeToEditPage(): string {
  return 'pages/' + EDIT_PAGE_NAME;
}

// Mirrors the resolution-page callbacks and records the call order.
export class ResolutionPageModel {
  private events: Array<string> = [];
  private selectedIndex: number = DEFAULT_RESOLUTION_INDEX;
  private width: number = DEFAULT_PHOTO_WIDTH;
  private height: number = DEFAULT_PHOTO_HEIGHT;
  private sceneMode: number = SCENE_NORMAL_PHOTO;
  private position: number = POSITION_BACK;
  private configRatio: number = 0;
  private rotation: number = 0;
  private foldStatus: number = FOLD_UNKNOWN;
  private showModeSwitchImg: boolean = false;
  private reloadFlag: boolean = false;
  private recording: boolean = false;
  private openEditPage: boolean = false;
  private targetVersion: number = 0;
  private deviceType: string = 'phone';

  private record(step: string): void {
    this.events.push(step);
  }

  setDevice(deviceType: string, targetVersion: number): void {
    this.deviceType = deviceType;
    this.targetVersion = targetVersion;
  }

  selectResolution(index: number): number {
    this.selectedIndex = changeResolutionIndex(this.selectedIndex, index);
    this.width = resolutionWidth(this.selectedIndex);
    this.height = resolutionHeight(this.selectedIndex);
    this.record('resolution:' + this.selectedIndex);
    return this.selectedIndex;
  }

  changeResolution(index: number): string {
    this.selectedIndex = changeResolutionIndex(this.selectedIndex, index);
    this.width = resolutionWidth(this.selectedIndex);
    this.height = resolutionHeight(this.selectedIndex);
    this.record('resolution-changed');
    return this.width + '*' + this.height;
  }

  setConfigMode(index: number): number {
    this.configRatio = configRatioForSelectedIndex(index);
    this.record('config:' + index);
    return this.configRatio;
  }

  setConfigRatio(ratio: number): void {
    this.configRatio = ratio;
  }

  updateRotation(rotation: number): number {
    this.rotation = normalizeDegree(rotation);
    this.record('rotation:' + this.rotation);
    return this.rotation;
  }

  updateRotationFlip(): number {
    const angle: number = updateRotationAngle(this.position);
    this.record('rotation-flip:' + angle);
    return angle;
  }

  switchCamera(): number {
    this.position = switchCameraPosition(this.position);
    this.record('camera:' + this.position);
    return this.position;
  }

  switchMode(next: number): boolean {
    if (!modeSwitchNeedsReinit(this.sceneMode, next)) {
      return false;
    }
    this.sceneMode = next;
    this.showModeSwitchImg = true;
    this.record('mode:' + next);
    return true;
  }

  applyFoldStatus(status: number, supportedPositions: Array<number>): string {
    this.foldStatus = status;
    const index: number = foldDeviceIndex(status, this.position, supportedPositions);
    if (index === -1) {
      this.position = foldFallbackPosition(supportedPositions);
      this.record('fold-fallback');
      return 'fallback:' + this.position;
    }
    this.record('fold:' + status);
    return 'status:' + status;
  }

  reloadXComponent(): boolean {
    this.reloadFlag = pageReloadToggle(this.reloadFlag);
    this.record('reload:' + this.reloadFlag);
    return this.reloadFlag;
  }

  startRecording(): boolean {
    if (!canStartVideo(this.recording, true)) {
      return false;
    }
    this.recording = true;
    this.record('record-start');
    return true;
  }

  stopRecording(): boolean {
    if (!canStopVideo(this.recording)) {
      return false;
    }
    this.recording = false;
    this.openEditPage = true;
    this.record('record-stop');
    return true;
  }

  xComponent(orientation: number, windowWidth: number, windowHeight: number): SizeInfo {
    return xComponentSize(this.deviceType === 'tablet', this.targetVersion, windowWidth, windowHeight,
      this.rotation, orientation, this.selectedIndex, this.configRatio);
  }

  eventsText(): string {
    return this.events.join(',');
  }

  eventCount(): number {
    return this.events.length;
  }

  resolutionIndex(): number {
    return this.selectedIndex;
  }

  resolution(): string {
    return this.width + '*' + this.height;
  }

  scene(): number {
    return this.sceneMode;
  }

  cameraPosition(): number {
    return this.position;
  }

  ratio(): number {
    return this.configRatio;
  }

  rotationValue(): number {
    return this.rotation;
  }

  fold(): number {
    return this.foldStatus;
  }

  modeSwitchVisible(): boolean {
    return this.showModeSwitchImg;
  }

  reloadValue(): boolean {
    return this.reloadFlag;
  }

  isRecording(): boolean {
    return this.recording;
  }

  isEditOpen(): boolean {
    return this.openEditPage;
  }
}

// Mirrors the initCamera2() branch status and release/switch sequences.
export class CameraInit2Model {
  private events: Array<string> = [];
  private sceneMode: number = SCENE_NORMAL_PHOTO;
  private position: number = POSITION_BACK;
  private deviceId: string = '';
  private started: boolean = false;
  private photoReady: boolean = false;
  private videoReady: boolean = false;
  private recordingValue: boolean = false;
  private releasedCount: number = 0;

  private record(step: string): void {
    this.events.push(step);
  }

  release(): number {
    this.record('release');
    this.started = false;
    this.photoReady = false;
    this.videoReady = false;
    this.recordingValue = false;
    this.releasedCount++;
    return this.releasedCount;
  }

  init(managerReady: boolean, cameraCount: number, positionFound: boolean, sceneSupported: boolean,
    outputAvailable: boolean, previewCreated: boolean, preview2Created: boolean, profileFound: boolean,
    recorderReady: boolean, openOk: boolean): string {
    this.release();
    if (!managerReady) { return 'no-manager'; }
    if (cameraCount < 1) { return 'no-camera'; }
    if (!positionFound) { return 'no-position'; }
    if (!sceneSupported) { return 'scene-unsupported'; }
    if (!outputAvailable) { return 'no-output'; }
    this.record('output');
    if (!previewCreated) { return 'preview-failed'; }
    this.record('preview');
    if (!preview2Created) { return 'preview2-failed'; }
    this.record('preview2');
    if (!profileFound) { return 'profile-failed'; }
    this.record('profile');
    if (this.sceneMode === SCENE_NORMAL_PHOTO) {
      this.photoReady = true;
    } else {
      if (!recorderReady) { return 'recorder-failed'; }
      this.videoReady = true;
    }
    if (!openOk) { return 'open-failed'; }
    this.record('open');
    this.started = true;
    this.record('start');
    return 'ok';
  }

  switchPosition(): number {
    if (!this.started) { return -1; }
    this.position = switchCameraPosition(this.position);
    this.record('switch');
    return this.position;
  }

  takePicture(): boolean {
    if (!this.photoReady) { return false; }
    this.record('capture');
    return true;
  }

  startVideo(): boolean {
    if (!canStartVideo(this.recordingValue, this.videoReady)) { return false; }
    this.recordingValue = true;
    this.record('video-start');
    return true;
  }

  stopVideo(): boolean {
    if (!canStopVideo(this.recordingValue)) { return false; }
    this.recordingValue = false;
    this.record('video-stop');
    return true;
  }

  setSceneMode(mode: number): number {
    this.sceneMode = mode;
    this.record('scene:' + mode);
    return mode;
  }

  eventsText(): string {
    return this.events.join(',');
  }

  eventCount(): number {
    return this.events.length;
  }

  device(): string {
    return this.deviceId;
  }

  scene(): number {
    return this.sceneMode;
  }

  positionValue(): number {
    return this.position;
  }

  startedValue(): boolean {
    return this.started;
  }

  recording(): boolean {
    return this.recordingValue;
  }

  released(): number {
    return this.releasedCount;
  }
}

// Mirrors the camera notification callbacks.
export class ResolutionEventModel {
  private frameStartCount: number = 0;
  private captureStartCount: number = 0;
  private photoAssetCount: number = 0;
  private photoAvailableCount: number = 0;
  private errorCount: number = 0;
  private statusCount: number = 0;
  private foldCount: number = 0;
  private lastEvent: string = '';

  onFrameStart(): number {
    this.frameStartCount++;
    this.lastEvent = 'frameStart';
    return this.frameStartCount;
  }

  onCaptureStart(): number {
    this.captureStartCount++;
    this.lastEvent = 'captureStart';
    return this.captureStartCount;
  }

  onPhotoAsset(asset: string): boolean {
    if (asset.length === 0) { return false; }
    this.photoAssetCount++;
    this.lastEvent = 'photoAsset';
    return true;
  }

  onPhotoAvailable(bufferSize: number): boolean {
    if (bufferSize <= 0) { return false; }
    this.photoAvailableCount++;
    this.lastEvent = 'photoAvailable';
    return true;
  }

  onError(code: number): number {
    this.errorCount++;
    this.lastEvent = 'error';
    return code;
  }

  onStatus(status: number): number {
    this.statusCount++;
    this.lastEvent = 'status';
    return status;
  }

  onFold(status: number): number {
    this.foldCount++;
    this.lastEvent = 'fold';
    return status;
  }

  counts(): string {
    return this.frameStartCount + ':' + this.captureStartCount + ':' + this.photoAssetCount + ':' +
      this.photoAvailableCount + ':' + this.errorCount + ':' + this.statusCount + ':' + this.foldCount;
  }

  last(): string {
    return this.lastEvent;
  }
}

// Mirrors EditPage save/back flows.
export class EditPageModel {
  private sceneMode: number = SCENE_NORMAL_PHOTO;
  private photoUri: string = '';
  private videoUri: string = '';
  private controls: boolean = true;
  private backCount: number = 0;
  private saveCount: number = 0;
  private lastToast: string = '';

  appear(sceneMode: number, photoUri: string, filesDir: string, fileName: string): void {
    this.sceneMode = sceneMode;
    this.photoUri = photoUri;
    this.videoUri = 'file://' + filesDir + '/' + fileName;
  }

  save(errCode: number): string {
    this.saveCount++;
    this.lastToast = saveToastText(errCode);
    return this.lastToast;
  }

  clickVideo(): boolean {
    this.controls = !this.controls;
    return this.controls;
  }

  finishVideo(): void {
    this.controls = true;
  }

  back(): number {
    this.backCount++;
    return this.backCount;
  }

  scene(): number {
    return this.sceneMode;
  }

  photo(): string {
    return this.photoUri;
  }

  video(): string {
    return this.videoUri;
  }

  controlsValue(): boolean {
    return this.controls;
  }

  backValue(): number {
    return this.backCount;
  }

  saveValue(): number {
    return this.saveCount;
  }

  toast(): string {
    return this.lastToast;
  }
}

export function xComponentSizeText(isTabletDevice: boolean, targetVersion: number, windowWidth: number,
  windowHeight: number, rotation: number, cameraOrientation: number, selectedIndex: number,
  configRatio: number): string {
  const size: SizeInfo = xComponentSize(isTabletDevice, targetVersion, windowWidth, windowHeight, rotation,
    cameraOrientation, selectedIndex, configRatio);
  return size.width + '*' + size.height;
}