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

// Computations transcribed from component samples whose logic lives inside @Component structs:
// particleSample/ParticleSample.ets, multiplexSample/ScrollItem.ets, swiperSample/SwiperSample.ets,
// waterFlowSample/WaterFlowSample.ets, sliderSample/SliderSample.ets and textAndInput/InputUtil.ts.

// Mirrors DISPLAY_COUNT and MIN_SCALE of SwiperSample.ets.
export const DISPLAY_COUNT: number = 2;
export const MIN_SCALE: number = 0.75;
// Mirrors the delete threshold of ScrollItem.onActionEnd() (scaleX < 0.15 deletes the card).
export const DELETE_SCALE: number = 0.15;
// Mirrors the default windowHeight of ScrollItem.ets.
export const DEFAULT_WINDOW_HEIGHT: number = 720;
// Mirrors the item heights pushed by WaterFlowSample.getItemSizeArray().
export const WATER_FLOW_HEIGHTS: number[] = [102, 136, 136, 102];

// Mirrors ParticleSample.elevation(x, y, z).
export function elevationOf(x: number, y: number, z: number): number {
  const distance: number = Math.sqrt(x * x + y * y + z * z);
  if (distance !== 0 && !isNaN(distance) && z / distance >= -1 && z / distance <= 1) {
    return Math.acos(z / distance);
  }
  return 0.00000001;
}

// Mirrors ParticleSample.rgb(): a short #rgb colour derived from a phase value.
export function rgbOf(colorRGBData: number): string {
  const v: number = colorRGBData + 0.000001;
  const r: number = Math.round((0.5 + Math.sin(v) * 0.5) * 16);
  const g: number = Math.round((0.5 + Math.cos(v) * 0.5) * 16);
  const b: number = Math.round((0.5 - Math.sin(v) * 0.5) * 16);
  return `#${r.toString(16)}${g.toString(16)}${b.toString(16)}`;
}

// Mirrors ParticleSample.interpolateColors(RGB1, RGB2, degree).
export function interpolateColorsOf(rgb1: number[], rgb2: number[], degree: number): number[] {
  if (rgb1.length < 3 || rgb2.length < 3) {
    return [];
  }
  const w2: number = degree;
  const w1: number = 1 - w2;
  return [w1 * rgb1[0] + w2 * rgb2[0], w1 * rgb1[1] + w2 * rgb2[1], w1 * rgb1[2] + w2 * rgb2[2]];
}

// Mirrors ParticleSample.rgbArray(): 0..256 channels derived from a phase value.
export function rgbArrayOf(colorRGBData: number): number[] {
  const v: number = colorRGBData + 0.000001;
  return [Math.round((0.5 + Math.sin(v) * 0.5) * 256), Math.round((0.5 + Math.cos(v) * 0.5) * 256),
    Math.round((0.5 - Math.sin(v) * 0.5) * 256)];
}

// Mirrors ParticleSample.colorString(): '#' + two hex digits per rounded channel.
export function colorStringOf(colorArray: number[]): string {
  if (colorArray.length < 3) {
    return '';
  }
  const hex = (value: number): string => (`0${Math.round(value).toString(16)}`).slice(-2);
  return `#${hex(colorArray[0])}${hex(colorArray[1])}${hex(colorArray[2])}`;
}

// Mirrors ScrollItem.onActionUpdate(): the slide coefficient after a vertical drag step.
export function nextSlideOf(sx: number, offsetY: number, lastOffsetY: number, windowHeight: number): number {
  if (offsetY - lastOffsetY <= 0) {
    return sx - Math.abs(offsetY - lastOffsetY) / windowHeight;
  }
  return sx + Math.abs(offsetY - lastOffsetY) / windowHeight;
}

// Mirrors ScrollItem.move(): this.sx clamped to [0, 1].
export function clampSlideOf(sx: number): number {
  return sx > 1 ? 1 : sx < 0 ? 0 : sx;
}

// Mirrors ScrollItem.move(): scaleX = pow(sx, 7) clamped.
export function cardScaleOf(sx: number): number {
  return Math.pow(sx, 7) > 1 ? 1 : sx < 0 ? 0 : Math.pow(sx, 7);
}

// Mirrors ScrollItem.move(): angle = min(((1 - sx) * 30) ^ 2, 90).
export function cardAngleOf(sx: number): number {
  const an: number = Math.pow((1 - sx) * 30, 2);
  return an > 90 ? 90 : an;
}

// Mirrors ScrollItem.move(): translateY = min(log(2 - sx) * -(windowHeight * 2), 0).
export function cardTranslateYOf(sx: number, windowHeight: number): number {
  const y: number = Math.log(2 - sx) * -(windowHeight * 2);
  return y > 0 ? 0 : y;
}

// Mirrors ScrollItem.onActionEnd(): 'restore' for 0.15 <= scaleX < 1, 'delete' below 0.15, otherwise 'none'.
export function releaseActionOf(scaleX: number): string {
  if (scaleX >= DELETE_SCALE && scaleX < 1) {
    return 'restore';
  }
  if (scaleX < DELETE_SCALE) {
    return 'delete';
  }
  return 'none';
}

// Mirrors SwiperSample customContentTransition(): whether the page keeps its default appearance.
export function isOutsideTransition(position: number, index: number): boolean {
  return position <= index % DISPLAY_COUNT || position >= DISPLAY_COUNT + index % DISPLAY_COUNT;
}

// Mirrors SwiperSample: opacity = 1 - relativePosition / DISPLAY_COUNT inside the transition range.
export function swiperOpacityOf(position: number, index: number): number {
  if (isOutsideTransition(position, index)) {
    return 1.0;
  }
  return 1 - (position - index % DISPLAY_COUNT) / DISPLAY_COUNT;
}

// Mirrors SwiperSample: scale = MIN_SCALE + (1 - MIN_SCALE) * (1 - relativePosition / DISPLAY_COUNT).
export function swiperScaleOf(position: number, index: number): number {
  if (isOutsideTransition(position, index)) {
    return 1.0;
  }
  return MIN_SCALE + (1 - MIN_SCALE) * (1 - (position - index % DISPLAY_COUNT) / DISPLAY_COUNT);
}

// Mirrors SwiperSample: the translate applied with closeTwoPagesTogether and cancelDefaultTranslate switches.
export function swiperTranslateOf(position: number, index: number, mainAxisLength: number, closeTogether: boolean,
  cancelDefault: boolean): number {
  if (isOutsideTransition(position, index)) {
    return 0.0;
  }
  const relativePosition: number = position - index % DISPLAY_COUNT;
  let translate: number = 0.0;
  if (closeTogether) {
    const itemSpace: number = (1 - swiperScaleOf(position, index)) * mainAxisLength;
    translate += index % DISPLAY_COUNT === 0 ? itemSpace / 2.0 : -itemSpace / 2.0;
  }
  if (cancelDefault) {
    translate -= relativePosition * mainAxisLength;
  }
  return translate;
}

// Mirrors WaterFlowSample.getItemSizeArray(): heights cycle 102, 136, 136, 102.
export function waterFlowHeightOf(index: number): number {
  return WATER_FLOW_HEIGHTS[((index % 4) + 4) % 4];
}

// Mirrors Image('resources/base/media/water_flow_' + item % 4 + '.png').
export function waterFlowImageOf(item: number): string {
  return `resources/base/media/water_flow_${item % 4}.png`;
}

// Mirrors the sum of the first n flow item heights (column-free content height).
export function waterFlowTotalHeightOf(count: number): number {
  let total: number = 0;
  for (let i: number = 0; i < count; i++) {
    total += waterFlowHeightOf(i);
  }
  return total;
}

// Mirrors SliderSample onChange(): Begin 0, Moving 1, End 2, Click 3, anything else 2.
export function sliderChangeOf(mode: number): number {
  switch (mode) {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    default:
      return 2;
  }
}

// Mirrors Text(`${Math.trunc(this.minOrMaxValue)}`).
export function sliderLabelOf(value: number): string {
  return `${Math.trunc(value)}`;
}

// Mirrors InputUtil.isEmpty(): 'undefined', '' and whitespace-only strings are empty.
export function isEmptyInput(str: string): boolean {
  return str === 'undefined' || str.length === 0 || !new RegExp('[^\\s]').test(str);
}

// Mirrors InputUtil.checkNeedNumberSpace(): numbers with + ; , # * must start with '+'.
export function checkNeedNumberSpace(numText: string): boolean {
  const isSpace: RegExp = new RegExp('[\\+;,#\\*]', 'g');
  const isRule: RegExp = new RegExp('^\\+.*');
  if (isSpace.test(numText)) {
    return isRule.test(numText);
  }
  return true;
}

// Mirrors InputUtil.removeSpace().
export function removeSpace(str: string): string {
  if (isEmptyInput(str)) {
    return '';
  }
  return str.replace(new RegExp('[\\s]', 'g'), '');
}

// Mirrors the multiplex card gesture of ScrollItem: drag updates, release decision and restore.
export class MultiplexCardState {
  sx: number = 1;
  scaleX: number = 1;
  angle: number = 0;
  translateY: number = 0;
  offsetY: number = 0;
  windowHeight: number = DEFAULT_WINDOW_HEIGHT;
  deleted: boolean = false;

  // Mirrors onActionUpdate() followed by move(sx).
  drag(offsetY: number): number {
    const sx: number = nextSlideOf(this.sx, offsetY, this.offsetY, this.windowHeight);
    this.sx = clampSlideOf(sx);
    this.scaleX = cardScaleOf(sx);
    this.angle = cardAngleOf(sx);
    this.translateY = cardTranslateYOf(sx, this.windowHeight);
    this.offsetY = offsetY;
    return this.scaleX;
  }

  // Mirrors onActionEnd(): restore or delete depending on the reached scale.
  release(): string {
    const action: string = releaseActionOf(this.scaleX);
    this.offsetY = 0;
    if (action === 'restore') {
      this.sx = 1;
      this.scaleX = 1;
      this.angle = 0;
      this.translateY = 0;
    } else if (action === 'delete') {
      this.deleted = true;
    }
    return action;
  }
}

// Mirrors the particle camera update of particleEnginePerform() for one frame.
export class ParticleCamera {
  frameNo: number = 0;
  camX: number = 0;
  camY: number = 0;
  camZ: number = 0;
  yaw: number = 0;
  pitch: number = 0;

  constructor(camX: number, camZ: number) {
    this.camX = camX;
    this.camZ = camZ;
  }

  // Mirrors the camera part of particleEnginePerform(); returns the new yaw.
  perform(): number {
    const p: number = Math.atan2(this.camX, this.camZ);
    let d: number = Math.sqrt(this.camX * this.camX + this.camZ * this.camZ);
    d -= Math.sin(this.frameNo / 80) / 25;
    const t: number = Math.cos(this.frameNo / 300) / 165;
    this.camX = Math.sin(p + t) * d;
    this.camZ = Math.cos(p + t) * d;
    this.camY = -Math.sin(this.frameNo / 220) * 15;
    this.yaw = Math.PI + p + t;
    this.pitch = elevationOf(this.camX, this.camZ, this.camY) - Math.PI / 2;
    this.frameNo++;
    return this.yaw;
  }
}
