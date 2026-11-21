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

// Deterministic transcription of the behaviour the camera-animation sample relies on.
// XComponent, camera hardware, PixelMap, router, timers and animateToImmediately are replaced by
// explicit inputs so that every call sequence has one observable, reproducible result.

// Mirrors Constants.ts.
export const X_COMPONENT_SURFACE_WIDTH: number = 1920;
export const X_COMPONENT_SURFACE_HEIGHT: number = 1080;
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
export const ZOOM_RADIO_MIN: number = 1;
export const ZOOM_RADIO_MAX: number = 6;
export const ZOOM_RADIO_MAX_STEP: number = 0.1;
export const ZOOM_RADIO_MIN_STEP: number = 0.01;
export const CAPTURE_COLUMN_WIDTH: number = 50;
export const CAPTURE_ROW_HEIGHT: number = 28;
export const AUDIO_BITRATE: number = 48000;
export const AUDIO_CHANNELS: number = 2;
export const AUDIO_SAMPLE_RATE: number = 48000;
export const VIDEO_BITRATE: number = 512000;
export const MAX_VIDEO_FRAME: number = 60;
export const FLASH_POSITION_X: number = 0;
export const FLASH_POSITION_Y: number = 50;

// Mirrors BlurAnimateUtil.ts.
export const SHOW_BLUR_DURATION: number = 200;
export const HIDE_BLUR_DURATION: number = 200;
export const ROTATION_DURATION: number = 200;
export const FLIP_DELAY: number = 50;
export const ROTATE_AXIS: number = 0.5;
export const IMG_ROTATE_ANGLE_90: number = 90;
export const IMG_ROTATE_ANGLE_270: number = 270;
export const IMG_FLIP_ANGLE_0: number = 0;
export const IMG_FLIP_ANGLE_180: number = 180;
export const IMG_FLIP_ANGLE_90: number = 90;
export const IMG_FLIP_ANGLE_270: number = 270;
export const IMG_FLIP_ANGLE_MINUS_90: number = -90;
export const ANIM_MODE_SWITCH_BLUR: number = 48;
export const IMG_SCALE: number = 0.75;

// Mirrors camera.SceneMode / camera.FlashMode members used by the sample.
export const SCENE_NORMAL_PHOTO: number = 1;
export const SCENE_NORMAL_VIDEO: number = 2;
export const FLASH_MODE_CLOSE: number = 0;
export const FLASH_MODE_OPEN: number = 1;
export const FLASH_MODE_AUTO: number = 2;
export const FLASH_MODE_ALWAYS_OPEN: number = 3;

// Mirrors the CameraService profile objects.
export const PREVIEW_FORMAT: number = 1003;
export const PHOTO_FORMAT: number = 2000;
export const VIDEO_FORMAT: number = 1003;
export const PROFILE_WIDTH: number = 1920;
export const PROFILE_HEIGHT: number = 1080;
export const VIDEO_FRAME_MIN: number = 30;
export const VIDEO_FRAME_MAX: number = 60;

// Mirrors SlideComponent / FocusAreaComponent constants.
export const FRACTION_DIGITS: number = 2;
export const FOCUS_FRAME_DURATION: number = 3500;
export const FOCUS_FRAME_SIZE: number = 120;
export const FOCUS_FRAME_HALF: number = 60;

export function round6(value: number): number {
  return Math.round(value * 1000000) / 1000000;
}

// Mirrors DateTimeUtil.fill().
export function fill(value: number): string {
  return (value > 9 ? '' : '0') + value;
}

// Mirrors DateTimeUtil.concatDate().
export function concatDate(year: number, month: number, date: number): string {
  return '' + year + fill(month) + fill(date);
}

// Mirrors DateTimeUtil.concatTime().
export function concatTime(hours: number, minutes: number, seconds: number): string {
  return fill(hours) + fill(minutes) + fill(seconds);
}

// Mirrors DateTimeUtil.getVideoTime().
export function getVideoTime(millisecond: number): string {
  const minute: number = Math.floor(millisecond / 60000);
  const second: number = Math.floor((millisecond - minute * 60000) / 1000);
  return fill(minute) + ' : ' + fill(second);
}

// Mirrors FocusAreaComponent: focus x = touchY / xComponentHeight.
export function focusPointX(touchY: number, height: number): number {
  return round6(touchY / height);
}

// Mirrors FocusAreaComponent: focus y = 1 - touchX / xComponentWidth.
export function focusPointY(touchX: number, width: number): number {
  return round6(1 - touchX / width);
}

// Mirrors FocusComponent: focus frame x = touchX - mFocusPoint.
export function focusFrameX(touchX: number): number {
  return touchX - FOCUS_FRAME_HALF;
}

// Mirrors FocusComponent: focus frame y = touchY - mFocusPoint.
export function focusFrameY(touchY: number): number {
  return touchY - FOCUS_FRAME_HALF;
}

// Mirrors the 3500 ms focus frame display duration.
export function focusFrameDelay(): number {
  return FOCUS_FRAME_DURATION;
}

// Mirrors FlashingLightComponent: (flashMode + 1) % 4.
export function nextFlashMode(mode: number): number {
  return (mode + 1) % 4;
}

// Mirrors flashModeChange() icon selection.
export function flashIconName(mode: number): string {
  if (mode === FLASH_MODE_OPEN) {
    return 'ic_camera_public_flash_on';
  }
  if (mode === FLASH_MODE_AUTO) {
    return 'ic_camera_public_flash_auto';
  }
  if (mode === FLASH_MODE_ALWAYS_OPEN) {
    return 'flash_always_on';
  }
  return 'ic_camera_public_flash_off';
}

// Mirrors FlashingLightComponent.getTextDefault().
export function whiteBalanceText(num: number): string {
  if (num === 0) {
    return '自动';
  }
  if (num === 1) {
    return '阴天';
  }
  if (num === 2) {
    return '白炽光';
  }
  if (num === 3) {
    return '荧光';
  }
  if (num === 4) {
    return '日光';
  }
  if (num === 5) {
    return '手动';
  }
  return '';
}

// The white balance panel only ships the six listed options.
export function whiteBalanceValid(num: number): boolean {
  return num >= 0 && num <= 5;
}

// Mirrors the ModeComponent camera switch: 0 -> 1, anything else -> 0.
export function switchCameraIndex(index: number): number {
  return index === 0 ? 1 : 0;
}

// Mirrors CameraService.takePicture(): mirror = deviceIndex ? true : false.
export function mirrorForCapture(index: number): boolean {
  return index !== 0;
}

// Mirrors CameraService.updateSliderValue(): step depends on the maximum zoom.
export function sliderStep(max: number): number {
  return max > ZOOM_RADIO_MAX ? ZOOM_RADIO_MAX_STEP : ZOOM_RADIO_MIN_STEP;
}

// Mirrors CameraService.updateSliderValue(): maximum zoom is capped at 6.
export function sliderMax(max: number): number {
  return max > ZOOM_RADIO_MAX ? ZOOM_RADIO_MAX : max;
}

// Mirrors SlideComponent: value is clamped into the exposed range.
export function zoomClamp(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

// Mirrors SlideComponent: Number(value.toFixed(2)).
export function zoomRound(value: number): number {
  return Number(value.toFixed(FRACTION_DIGITS));
}

// Mirrors the zoom badge text.
export function zoomLabel(value: number): string {
  return value + 'x';
}

// Mirrors CameraService.initCamera(): cameras.length < 1 || cameras.length < index + 1.
export function deviceIndexValid(count: number, index: number): boolean {
  return count >= 1 && count >= index + 1;
}

// Mirrors CameraService.isSupportedSceneMode().
export function sceneModeSupported(modes: Array<number>, mode: number): boolean {
  return modes.indexOf(mode) !== -1;
}

// Mirrors CameraService.getVideoProfile(): both frame limits must be <= MAX_VIDEO_FRAME.
export function videoFrameAllowed(min: number, max: number): boolean {
  return min <= MAX_VIDEO_FRAME && max <= MAX_VIDEO_FRAME;
}

// Mirrors CameraService.getPreviewProfile().
export function previewProfileMatch(width: number, height: number, format: number): boolean {
  return width === PROFILE_WIDTH && height === PROFILE_HEIGHT && format === PREVIEW_FORMAT;
}

// Mirrors CameraService.getPhotoProfile().
export function photoProfileMatch(width: number, height: number, format: number): boolean {
  return width === PROFILE_WIDTH && height === PROFILE_HEIGHT && format === PHOTO_FORMAT;
}

// Mirrors CameraService.getVideoProfile().
export function videoProfileMatch(width: number, height: number, format: number, min: number, max: number): boolean {
  return width === PROFILE_WIDTH && height === PROFILE_HEIGHT && format === VIDEO_FORMAT &&
    videoFrameAllowed(min, max);
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

// kind: 0 preview, 1 photo, 2 video.
export function profileMatches(kind: number, profile: Profile): boolean {
  if (kind === 0) {
    return previewProfileMatch(profile.width, profile.height, profile.format);
  }
  if (kind === 1) {
    return photoProfileMatch(profile.width, profile.height, profile.format);
  }
  return videoProfileMatch(profile.width, profile.height, profile.format, profile.minFrame, profile.maxFrame);
}

// Mirrors the findIndex() calls of CameraService; -1 means "not supported".
export function findProfileIndex(profiles: Array<Profile>, kind: number): number {
  for (let i: number = 0; i < profiles.length; i++) {
    if (profileMatches(kind, profiles[i])) {
      return i;
    }
  }
  return -1;
}

// Mirrors BlurAnimateUtil.doSurfaceShot(): an empty surface id aborts the shot.
export function surfaceShotGuard(surfaceId: string): boolean {
  return surfaceId !== '';
}

// curPosition === 1 means the back camera.
export function isBackCamera(position: number): boolean {
  return position === 1;
}

export function positionName(position: number): string {
  return position === 1 ? 'back' : 'front';
}

// Mirrors showBlurAnim()/rotateFirstAnim()/rotateSecondAnim() image compensation.
export function rotationAngleOf(position: number): number {
  return position === 1 ? IMG_ROTATE_ANGLE_90 : IMG_ROTATE_ANGLE_270;
}

// Mirrors the initial component flip angle.
export function initialFlipOf(position: number): number {
  return position === 1 ? IMG_FLIP_ANGLE_0 : IMG_FLIP_ANGLE_180;
}

// Mirrors rotateFirstAnim() target flip angle.
export function firstFlipTargetOf(position: number): number {
  return position === 1 ? IMG_FLIP_ANGLE_90 : IMG_FLIP_ANGLE_270;
}

// Mirrors rotateSecondAnim() instantaneous start angle.
export function secondFlipStartOf(position: number): number {
  return position === 1 ? IMG_FLIP_ANGLE_MINUS_90 : IMG_FLIP_ANGLE_180;
}

// Mirrors rotateSecondAnim() target flip angle.
export function secondFlipTargetOf(position: number): number {
  return position === 1 ? IMG_FLIP_ANGLE_0 : IMG_FLIP_ANGLE_180;
}

// Mirrors showBlurAnim() blur amount.
export function modeSwitchBlur(): number {
  return ANIM_MODE_SWITCH_BLUR;
}

// Mirrors blurFirstAnim() scale amount.
export function modeSwitchScale(): number {
  return IMG_SCALE;
}

// step: 0 showBlur, 1 hideBlur, 2 rotation, 3 flip delay, -1 unknown.
export function durationOf(step: number): number {
  if (step === 0) {
    return SHOW_BLUR_DURATION;
  }
  if (step === 1) {
    return HIDE_BLUR_DURATION;
  }
  if (step === 2) {
    return ROTATION_DURATION;
  }
  if (step === 3) {
    return FLIP_DELAY;
  }
  return -1;
}

// Mirrors flashBlackAnim().
export function flashBlackDelay(): number {
  return 50;
}

export function flashBlackTargetOpacity(): number {
  return 0;
}

export function flashBlackResetOpacity(): number {
  return 1;
}

// Mirrors CameraService.startVideo()/stopVideo() guards.
export function canStartVideo(recording: boolean): boolean {
  return !recording;
}

export function canStopVideo(recording: boolean): boolean {
  return recording;
}

// Mirrors CameraService.isControlCenterSupport().
export function controlCenterSupported(sceneMode: number, supported: boolean): boolean {
  return sceneMode === SCENE_NORMAL_VIDEO && supported;
}

// Mirrors CameraService.isMacroSupport().
export function macroSupported(supported: boolean): boolean {
  return supported;
}

// Mirrors CameraService.isExposureBiasRange().
export function exposureBiasClamped(value: number, min: number, max: number): number {
  return zoomClamp(value, min, max);
}

// Mirrors CameraService.isMeteringPoint().
export function meteringX(touchY: number, height: number): number {
  return round6(touchY / height);
}

export function meteringY(touchX: number, width: number): number {
  return round6(1 - touchX / width);
}

// Mirrors EditPage video source construction.
export function videoUriOf(filePath: string): string {
  return 'file://' + filePath;
}

// Mirrors XComponent.onLoad(): surface rect swaps width and height.
export function surfaceRectWidth(): number {
  return X_COMPONENT_SURFACE_HEIGHT;
}

export function surfaceRectHeight(): number {
  return X_COMPONENT_SURFACE_WIDTH;
}

// Mirrors px2vp(Constants.X_COMPONENT_*): px / density.
export function px2vp(px: number, density: number): number {
  return round6(px / density);
}

// Mirrors the mode labels of ModeComponent.
export function sceneModeText(mode: number): string {
  if (mode === SCENE_NORMAL_PHOTO) {
    return '拍照';
  }
  if (mode === SCENE_NORMAL_VIDEO) {
    return '录像';
  }
  return '';
}

// Mirrors the pre-increment of modeChange/switchCamera/captureClick/frameStart flags.
export function nextFlag(flag: number): number {
  return flag + 1;
}

// Mirrors updateSliderValue(): AppStorage is only written for a non-empty range.
export function sliderApplies(rangeLength: number): boolean {
  return rangeLength !== 0;
}

// Mirrors EditPage.aboutToAppear() scene branch.
export function editUsesPhoto(sceneMode: number): boolean {
  return sceneMode === SCENE_NORMAL_PHOTO;
}

export function editUsesVideo(sceneMode: number): boolean {
  return sceneMode === SCENE_NORMAL_VIDEO;
}

// Mirrors ModeComponent.onJumpClick().
export function routerUrlForEdit(): string {
  return 'pages/EditPage';
}

// There are four flash modes cycled by FlashingLightComponent.
export function flashModeCount(): number {
  return 4;
}

// Mirrors CameraService scene state, output creation, capture/record guards and release cleanup.
export class CameraSessionModel {
  private events: Array<string> = [];
  private sceneMode: number = SCENE_NORMAL_PHOTO;
  private deviceIndex: number = 0;
  private previewReady: boolean = false;
  private photoReady: boolean = false;
  private videoReady: boolean = false;
  private startedFlag: boolean = false;
  private recordingValue: boolean = false;
  private flashModeValue: number = FLASH_MODE_CLOSE;
  private focusXValue: number = 0;
  private focusYValue: number = 0;
  private exposureValue: number = 0;
  private zoomValue: number = 1;
  private sliderMinValue: number = 1;
  private sliderMaxNumber: number = 6;
  private sliderStepNumber: number = 0.1;
  private releasedCount: number = 0;

  private record(step: string): void {
    this.events.push(step);
  }

  release(): number {
    this.record('release');
    this.previewReady = false;
    this.photoReady = false;
    this.videoReady = false;
    this.startedFlag = false;
    this.recordingValue = false;
    this.releasedCount++;
    return this.releasedCount;
  }

  init(managerReady: boolean, cameraCount: number, deviceIndex: number, sceneSupported: boolean,
    openOk: boolean): string {
    this.release();
    if (!managerReady) {
      return 'no-manager';
    }
    this.record('manager');
    if (!deviceIndexValid(cameraCount, deviceIndex)) {
      return 'no-camera';
    }
    this.record('cameras');
    this.deviceIndex = deviceIndex;
    if (!sceneSupported) {
      return 'scene-unsupported';
    }
    this.record('scene');
    this.previewReady = true;
    this.record('preview');
    if (this.sceneMode === SCENE_NORMAL_PHOTO) {
      this.photoReady = true;
      this.record('photo');
    } else if (this.sceneMode === SCENE_NORMAL_VIDEO) {
      this.videoReady = true;
      this.record('video');
    }
    if (!openOk) {
      return 'open-failed';
    }
    this.record('open');
    this.startedFlag = true;
    this.record('start');
    return 'ok';
  }

  switchCamera(): number {
    if (!this.startedFlag) {
      return -1;
    }
    this.deviceIndex = switchCameraIndex(this.deviceIndex);
    this.record('switch');
    return this.deviceIndex;
  }

  setSceneMode(mode: number): number {
    this.sceneMode = mode;
    this.record('scene-mode');
    return this.sceneMode;
  }

  takePicture(): boolean {
    if (!this.photoReady) {
      return false;
    }
    this.record('capture');
    return true;
  }

  startVideo(): boolean {
    if (!this.videoReady || this.recordingValue) {
      return false;
    }
    this.recordingValue = true;
    this.record('video-start');
    return true;
  }

  stopVideo(): boolean {
    if (!this.recordingValue) {
      return false;
    }
    this.recordingValue = false;
    this.record('video-stop');
    return true;
  }

  setFlashMode(mode: number, supported: boolean): boolean {
    if (!supported) {
      return false;
    }
    this.flashModeValue = mode;
    this.record('flash');
    return true;
  }

  setFocus(x: number, y: number): string {
    this.focusXValue = x;
    this.focusYValue = y;
    this.record('focus');
    return this.focusXValue + ',' + this.focusYValue;
  }

  setZoom(value: number): number {
    this.zoomValue = zoomClamp(zoomRound(value), this.sliderMinValue, this.sliderMaxNumber);
    this.record('zoom');
    return this.zoomValue;
  }

  setExposure(value: number, min: number, max: number): number {
    this.exposureValue = exposureBiasClamped(value, min, max);
    this.record('exposure');
    return this.exposureValue;
  }

  updateSlider(rangeMin: number, rangeMax: number): string {
    this.sliderMinValue = rangeMin;
    this.sliderMaxNumber = sliderMax(rangeMax);
    this.sliderStepNumber = sliderStep(rangeMax);
    this.record('slider');
    return this.sliderMinValue + '-' + this.sliderMaxNumber + '-' + this.sliderStepNumber;
  }

  steps(): string {
    return this.events.join(',');
  }

  stepCount(): number {
    return this.events.length;
  }

  device(): number {
    return this.deviceIndex;
  }

  scene(): number {
    return this.sceneMode;
  }

  recording(): boolean {
    return this.recordingValue;
  }

  flash(): number {
    return this.flashModeValue;
  }

  started(): boolean {
    return this.startedFlag;
  }

  preview(): boolean {
    return this.previewReady;
  }

  photo(): boolean {
    return this.photoReady;
  }

  video(): boolean {
    return this.videoReady;
  }

  released(): number {
    return this.releasedCount;
  }

  focus(): string {
    return this.focusXValue + ',' + this.focusYValue;
  }

  exposure(): number {
    return this.exposureValue;
  }

  zoom(): number {
    return this.zoomValue;
  }

  sliderMaxValue(): number {
    return this.sliderMaxNumber;
  }

  sliderStepValue(): number {
    return this.sliderStepNumber;
  }
}

// Mirrors the four @Watch handlers of Index.ets and records the animation call order.
export class AnimateModel {
  private events: Array<string> = [];
  private backCamera: boolean = false;
  public isShowBlur: boolean = false;
  public isShowBlack: boolean = false;
  public blur: number = 0;
  public opacity: number = 1;
  public scaleX: number = 1;
  public scaleY: number = 1;
  public rotation: number = 0;
  public flashOpacity: number = 1;

  constructor(backCamera: boolean) {
    this.backCamera = backCamera;
  }

  private record(step: string): void {
    this.events.push(step);
  }

  onModeChange(): void {
    this.record('mode:shot');
    this.isShowBlur = true;
    this.blur = 0;
    this.opacity = 1;
    this.scaleX = 1;
    this.scaleY = 1;
    this.record('mode:show');
    this.blur = ANIM_MODE_SWITCH_BLUR;
    this.record('mode:blur');
  }

  onFrameStart(): void {
    this.record('frame:hide');
    this.isShowBlack = false;
    this.opacity = 0;
    this.record('frame:fade');
    this.isShowBlur = false;
    this.blur = 0;
    this.opacity = 1;
    this.record('frame:done');
  }

  onSwitchCamera(): void {
    this.blurFirst();
    this.rotateFirst();
  }

  blurFirst(): void {
    this.record('switch:blurFirst');
    this.blur = 0;
    this.opacity = 1;
    this.scaleX = 1;
    this.scaleY = 1;
    this.blur = ANIM_MODE_SWITCH_BLUR;
    this.scaleX = IMG_SCALE;
    this.scaleY = IMG_SCALE;
    this.record('switch:blurFirst-anim');
    this.blurSecond();
  }

  blurSecond(): void {
    this.record('switch:blurSecond');
    this.scaleX = 1;
    this.scaleY = 1;
    this.record('switch:blurSecond-anim');
  }

  rotateFirst(): void {
    this.record('switch:rotateFirst');
    this.isShowBlack = true;
    this.isShowBlur = true;
    this.rotation = this.backCamera ? IMG_FLIP_ANGLE_0 : IMG_FLIP_ANGLE_180;
    this.record('switch:rotateFirst-anim');
    this.rotateSecond();
  }

  rotateSecond(): void {
    this.record('switch:rotateSecond');
    this.rotation = this.backCamera ? IMG_FLIP_ANGLE_MINUS_90 : IMG_FLIP_ANGLE_180;
    this.record('switch:rotateSecond-anim');
    this.rotation = this.backCamera ? IMG_FLIP_ANGLE_0 : IMG_FLIP_ANGLE_180;
    this.record('switch:rotateSecond-done');
  }

  onCaptureClick(): void {
    this.record('capture:flash');
    this.isShowBlack = true;
    this.flashOpacity = 1;
    this.flashOpacity = 0;
    this.record('capture:black');
    this.isShowBlack = false;
    this.flashOpacity = 1;
    this.record('capture:done');
  }

  steps(): string {
    return this.events.join(',');
  }

  stepCount(): number {
    return this.events.length;
  }

  state(): string {
    return (this.isShowBlur ? 'B' : '-') + (this.isShowBlack ? 'K' : '-') + ':' + this.blur + ':' + this.opacity +
      ':' + this.scaleX + ':' + this.rotation;
  }
}

// Mirrors FlashingLightComponent white balance panel state.
export class WhiteBalanceModel {
  private num: number = 0;
  private options: boolean = false;
  private first: boolean = true;

  toggleOptions(): boolean {
    this.options = !this.options;
    return this.options;
  }

  apply(num: number): string {
    this.num = num;
    this.options = false;
    this.first = !this.first;
    return whiteBalanceText(num);
  }

  text(): string {
    return whiteBalanceText(this.num);
  }

  selected(num: number): boolean {
    return this.num === num;
  }

  firstBol(): boolean {
    return this.first;
  }

  optionsShown(): boolean {
    return this.options;
  }
}

// Mirrors FlashingLightComponent flash/control-center/macro buttons.
export class FlashingLightModel {
  private modeValue: number = FLASH_MODE_CLOSE;
  private control: boolean = false;
  private macro: boolean = false;

  clickFlash(): number {
    this.modeValue = nextFlashMode(this.modeValue);
    return this.modeValue;
  }

  icon(): string {
    return flashIconName(this.modeValue);
  }

  clickControl(supported: boolean): boolean {
    if (!controlCenterSupported(SCENE_NORMAL_VIDEO, supported)) {
      this.control = false;
      return this.control;
    }
    this.control = !this.control;
    return this.control;
  }

  clickMacro(supported: boolean): boolean {
    if (!macroSupported(supported)) {
      this.macro = false;
      return this.macro;
    }
    this.macro = !this.macro;
    return this.macro;
  }

  mode(): number {
    return this.modeValue;
  }

  controlValue(): boolean {
    return this.control;
  }

  macroValue(): boolean {
    return this.macro;
  }
}

// Mirrors SlideComponent zoom state.
export class SlideModel {
  private zoomValue: number = 1;
  private minValue: number = 1;
  private maxValue: number = 6;
  private stepValue: number = 0.1;

  setRange(min: number, max: number): string {
    this.minValue = min;
    this.maxValue = sliderMax(max);
    this.stepValue = sliderStep(max);
    return this.minValue + '-' + this.maxValue + '-' + this.stepValue;
  }

  change(value: number): number {
    this.zoomValue = zoomClamp(zoomRound(value), this.minValue, this.maxValue);
    return this.zoomValue;
  }

  label(): string {
    return zoomLabel(this.zoomValue);
  }

  zoom(): number {
    return this.zoomValue;
  }

  min(): number {
    return this.minValue;
  }

  max(): number {
    return this.maxValue;
  }

  step(): number {
    return this.stepValue;
  }
}

// Mirrors EditPage media branch and the back-button flow.
export class EditPageModel {
  private sceneValue: number = SCENE_NORMAL_PHOTO;
  private photoUriValue: string = '';
  private videoUriValue: string = '';
  private controlsValue: boolean = true;
  private backCountValue: number = 0;
  private startCount: number = 0;
  private stopCount: number = 0;

  appear(sceneMode: number, photoUri: string, filePath: string): void {
    this.sceneValue = sceneMode;
    this.photoUriValue = photoUri;
    this.videoUriValue = videoUriOf(filePath);
  }

  clickVideo(): boolean {
    if (this.controlsValue) {
      this.startCount++;
    } else {
      this.stopCount++;
    }
    this.controlsValue = !this.controlsValue;
    return this.controlsValue;
  }

  onFinish(): void {
    this.controlsValue = true;
  }

  back(): number {
    this.backCountValue++;
    return this.backCountValue;
  }

  photoUri(): string {
    return this.photoUriValue;
  }

  videoUri(): string {
    return this.videoUriValue;
  }

  controls(): boolean {
    return this.controlsValue;
  }

  starts(): number {
    return this.startCount;
  }

  stops(): number {
    return this.stopCount;
  }

  backCount(): number {
    return this.backCountValue;
  }

  scene(): number {
    return this.sceneValue;
  }
}

// Mirrors GlobalContext key/value storage and apply().
export class GlobalContextModel {
  private strings: Map<string, string> = new Map<string, string>();
  private numbers: Map<string, number> = new Map<string, number>();
  private applies: Map<string, number> = new Map<string, number>();

  setString(key: string, value: string): void {
    this.strings.set(key, value);
  }

  getString(key: string): string {
    const value: string | undefined = this.strings.get(key);
    return value === undefined ? '' : value;
  }

  setNumber(key: string, value: number): void {
    this.numbers.set(key, value);
  }

  getNumber(key: string): number {
    const value: number | undefined = this.numbers.get(key);
    return value === undefined ? 0 : value;
  }

  has(key: string): boolean {
    return this.strings.has(key) || this.numbers.has(key);
  }

  remove(key: string): boolean {
    const removedString: boolean = this.strings.delete(key);
    const removedNumber: boolean = this.numbers.delete(key);
    return removedString || removedNumber;
  }

  size(): number {
    return this.strings.size + this.numbers.size;
  }

  apply(key: string): boolean {
    if (!this.has(key)) {
      return false;
    }
    const count: number | undefined = this.applies.get(key);
    this.applies.set(key, count === undefined ? 1 : count + 1);
    return true;
  }

  applyCount(key: string): number {
    const count: number | undefined = this.applies.get(key);
    return count === undefined ? 0 : count;
  }
}

// Mirrors the camera notification callbacks wired by CameraService.previewOutputCallBack(),
// photoOutputCallBack(), onSystemPressureLevelChange() and onCameraStatusChange().
export class CameraEventModel {
  private frameStartFlag: number = 0;
  private captureStartCount: number = 0;
  private frameShutterCount: number = 0;
  private captureEndCount: number = 0;
  private errorCount: number = 0;
  private photoAssetCount: number = 0;
  private pressureCount: number = 0;
  private cameraStatusCount: number = 0;
  private callbackBound: boolean = false;
  private lastAsset: string = '';

  // previewOutput.on('frameStart'): AppStorage.setOrCreate('frameStart', ++flag).
  onFrameStart(): number {
    this.frameStartFlag++;
    return this.frameStartFlag;
  }

  // previewOutput.on('frameEnd') only logs.
  onFrameEnd(): void {
  }

  // photoOutput.on('captureStartWithInfo').
  onCaptureStart(info: string): string {
    if (info.length > 0) {
      this.captureStartCount++;
    }
    return info;
  }

  // photoOutput.on('frameShutter').
  onFrameShutter(captureId: number): number {
    this.frameShutterCount++;
    return captureId;
  }

  // photoOutput.on('captureEnd').
  onCaptureEnd(frameCount: number): number {
    this.captureEndCount++;
    return frameCount;
  }

  // previewOutput/photoOutput/session on('error').
  onError(code: number): number {
    this.errorCount++;
    return code;
  }

  // photoOutput.on('photoAssetAvailable'): an undefined asset is ignored.
  onPhotoAssetAvailable(asset: string): boolean {
    if (asset.length === 0) {
      return false;
    }
    this.photoAssetCount++;
    this.lastAsset = asset;
    return true;
  }

  // session.on('systemPressureLevelChange'): only error code 0 is counted.
  onSystemPressure(level: number, errorCode: number): number {
    if (errorCode === 0) {
      this.pressureCount++;
    }
    return level;
  }

  // cameraManager.on('cameraStatus').
  onCameraStatus(status: number): number {
    this.cameraStatusCount++;
    return status;
  }

  bindSaveCallback(): boolean {
    this.callbackBound = true;
    return this.callbackBound;
  }

  counts(): string {
    return this.frameStartFlag + ':' + this.captureStartCount + ':' + this.frameShutterCount + ':' +
      this.captureEndCount + ':' + this.errorCount + ':' + this.photoAssetCount + ':' + this.pressureCount + ':' +
      this.cameraStatusCount;
  }

  asset(): string {
    return this.lastAsset;
  }

  bound(): boolean {
    return this.callbackBound;
  }
}