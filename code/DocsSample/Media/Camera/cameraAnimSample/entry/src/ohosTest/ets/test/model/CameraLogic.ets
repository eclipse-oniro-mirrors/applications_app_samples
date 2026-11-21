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
