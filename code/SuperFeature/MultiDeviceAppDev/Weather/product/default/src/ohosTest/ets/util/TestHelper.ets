/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * Shared helpers for hand-written logic suites.
 * - CanvasStubContext: records every draw call issued by SunCanvasFeature /
 *   AirQualityFeature so that assertions can target real output of the code
 *   under test without a live canvas.
 * - ResUtil: extracts the resource name out of the Resource object returned by
 *   RequestData so that volume cases can compare against frozen literals.
 */

import { initSun, initMoon } from '../../../main/ets/feature/SunCanvasFeature';
import { initRound } from '../../../main/ets/feature/AirQualityFeature';
import { MyDataSource, Forecast, WeekWeather, AirIndex, SuitData, AirData, HeaderData, City, CityListData, weather } from '@ohos/common';

export interface StubCall {
  method: string;
  args: Object[];
}

export interface HourItem {
  hours: string;
  wea: string;
  weaImg: string;
  tem: string;
  win: string;
  winSpeed: string;
}

export interface IndexItem {
  title: string;
  level: string;
  desc: string;
}

export interface AirStub {
  airQuality: string;
  airDesc: string;
}

/**
 * 占位图片对象：stub 上下文只记录 drawImage 调用，不消费图片内容
 */
class StubImage {
}

export class CanvasStubGradient {
  public stops: string[] = [];

  addColorStop(offset: number, color: string): void {
    this.stops.push(`${offset}|${color}`);
  }
}

export class CanvasStubContext {
  public width: number = 300;
  public height: number = 200;
  public font: string = '';
  public fillStyle: string = '';
  public strokeStyle: Object = '';
  public textAlign: string = '';
  public textBaseline: string = '';
  public lineWidth: number = 1;
  public lineCap: string = '';
  public calls: StubCall[] = [];
  public lastGradient: CanvasStubGradient | undefined = undefined;

  record(method: string, args: Object[]): void {
    this.calls.push({ method: method, args: args });
  }

  beginPath(): void {
    this.record('beginPath', []);
  }

  closePath(): void {
    this.record('closePath', []);
  }

  moveTo(x: number, y: number): void {
    this.record('moveTo', [x, y]);
  }

  lineTo(x: number, y: number): void {
    this.record('lineTo', [x, y]);
  }

  stroke(): void {
    this.record('stroke', []);
  }

  fillText(text: string, x: number, y: number): void {
    this.record('fillText', [text, x, y]);
  }

  arc(x: number, y: number, radius: number, startAngle: number, endAngle: number, counterclockwise: boolean): void {
    this.record('arc', [x, y, radius, startAngle, endAngle, counterclockwise]);
  }

  save(): void {
    this.record('save', []);
  }

  restore(): void {
    this.record('restore', []);
  }

  setLineDash(segments: number[]): void {
    this.record('setLineDash', [segments.join(',')]);
  }

  drawImage(...args: Object[]): void {
    this.record('drawImage', args);
  }

  createLinearGradient(x0: number, y0: number, x1: number, y1: number): CanvasStubGradient {
    const gradient = new CanvasStubGradient();
    this.lastGradient = gradient;
    this.record('createLinearGradient', [x0, y0, x1, y1]);
    return gradient;
  }

  count(method: string): number {
    return this.calls.filter((c: StubCall) => c.method === method).length;
  }

  reset(): void {
    this.calls = [];
    this.lastGradient = undefined;
    this.font = '';
    this.fillStyle = '';
    this.strokeStyle = '';
    this.textAlign = '';
    this.textBaseline = '';
    this.lineWidth = 1;
    this.lineCap = '';
  }

  lastOf(method: string): StubCall | undefined {
    const filtered = this.calls.filter((c: StubCall) => c.method === method);
    return filtered.length > 0 ? filtered[filtered.length - 1] : undefined;
  }

  nthOf(method: string, index: number): StubCall | undefined {
    const filtered = this.calls.filter((c: StubCall) => c.method === method);
    return index < filtered.length ? filtered[index] : undefined;
  }

  texts(): string[] {
    return this.calls
      .filter((c: StubCall) => c.method === 'fillText')
      .map((c: StubCall) => String(c.args[0]));
  }
}

/**
 * Media names of the weather resources referenced by RequestData. A $r()
 * literal carries a resource id but an empty params array at runtime, so the
 * id is matched against the same literals to recover the resource name.
 */
function mediaNameById(id: number): string {
  if (id === $r('app.media.sunny_bg').id) {
    return 'sunny_bg';
  }
  if (id === $r('app.media.rain_bg').id) {
    return 'rain_bg';
  }
  if (id === $r('app.media.yin_bg').id) {
    return 'yin_bg';
  }
  if (id === $r('app.media.weather_fine').id) {
    return 'weather_fine';
  }
  if (id === $r('app.media.weather_rain').id) {
    return 'weather_rain';
  }
  if (id === $r('app.media.weather_yin').id) {
    return 'weather_yin';
  }
  if (id === $r('app.media.ic_weather_sunny').id) {
    return 'ic_weather_sunny';
  }
  if (id === $r('app.media.ic_weather_yin').id) {
    return 'ic_weather_yin';
  }
  if (id === $r('app.media.ic_weather_rain').id) {
    return 'ic_weather_rain';
  }
  if (id === $r('app.media.ic_weather_cloudy').id) {
    return 'ic_weather_cloudy';
  }
  if (id === $r('app.media.ic_weather_sunset').id) {
    return 'ic_weather_sunset';
  }
  if (id === $r('app.media.ic_weather_night').id) {
    return 'ic_weather_night';
  }
  if (id === $r('app.media.ic_weather_lightrain').id) {
    return 'ic_weather_lightrain';
  }
  return '';
}

/**
 * Returns the resource name carried by a Resource object produced by $r() in
 * the code under test, e.g. 'app.media.sunny_bg' resolved back to 'sunny_bg'.
 * Scans params for the first name-like string, then falls back to the media
 * id table, and finally to the serialized form so that a stable string can
 * still be compared across branches.
 */
export function resName(res: Resource | string | undefined): string {
  if (res === undefined || res === null) {
    return '';
  }
  if (typeof res === 'string') {
    return res;
  }
  const resource: Resource = res;
  const params: (string | number)[] | undefined = resource.params;
  if (params !== undefined && params !== null) {
    for (let i = 0; i < params.length; i++) {
      const item = String(params[i]);
      if (item.length > 0 && !/^\d+$/.test(item)) {
        return item;
      }
    }
  }
  const byId: string = mediaNameById(resource.id);
  if (byId.length > 0) {
    return byId;
  }
  return JSON.stringify(resource);
}

export function asContext(stub: CanvasStubContext): CanvasRenderingContext2D {
  return stub as Object as CanvasRenderingContext2D;
}

/**
 * Invokes AirQualityFeature.initRound on the stub context and returns a
 * composite snapshot: `${radius}|${endAngle}|${fillTexts joined by ','}`.
 * Pure adapter: all expectations come from frozen literals in the cases.
 */
export function runInitRound(ctx: CanvasStubContext, airQuality: string, airDesc: string): string {
  ctx.reset();
  const air: AirStub = { airQuality: airQuality, airDesc: airDesc };
  initRound(asContext(ctx), air);
  const arc = ctx.lastOf('arc');
  const radius = arc !== undefined ? String(arc.args[2]) : 'none';
  const endAngle = arc !== undefined ? String(arc.args[4]) : 'none';
  return `${radius}|${endAngle}|${ctx.texts().join(',')}`;
}

/**
 * Invokes SunCanvasFeature.initSun on the stub context and returns a snapshot
 * of the canvas-independent drawing: baseline coordinates and text labels.
 */
export function runInitSun(ctx: CanvasStubContext): string {
  ctx.reset();
  initSun(asContext(ctx), new StubImage());
  const move = ctx.nthOf('moveTo', 0);
  const line = ctx.nthOf('lineTo', 0);
  const arc = ctx.lastOf('arc');
  const moveY = move !== undefined ? String(move.args[1]) : 'none';
  const lineX = line !== undefined ? String(line.args[0]) : 'none';
  const radius = arc !== undefined ? String(arc.args[2]) : 'none';
  return `${moveY}|${lineX}|${radius}|${ctx.texts().join(',')}`;
}

/**
 * Invokes SunCanvasFeature.initMoon on the stub context and returns a snapshot
 * of the moon arc radius and the drawn text labels.
 */
export function runInitMoon(ctx: CanvasStubContext): string {
  ctx.reset();
  initMoon(asContext(ctx), new StubImage(), new StubImage());
  const arc = ctx.lastOf('arc');
  const radius = arc !== undefined ? String(arc.args[2]) : 'none';
  return `${radius}|${ctx.texts().join(',')}`;
}

/**
 * Drives MyDataSource through one observable mode over a frozen-size dataset
 * and returns a composite snapshot for literal comparison. All expectations in
 * the cases are frozen literals; this adapter only orchestrates the SUT.
 */
export function runDs(n: number, mode: string): string {
  const src: string[] = [];
  for (let k = 0; k < n; k++) {
    src.push('s' + k);
  }
  const ds = new MyDataSource<string>(src);
  if (mode === 'total') {
    return String(ds.totalCount());
  }
  if (mode === 'last') {
    return n > 0 ? String(ds.getData(n - 1)) : 'empty';
  }
  if (mode === 'first') {
    return n > 0 ? String(ds.getData(0)) : 'empty';
  }
  if (mode === 'oob') {
    return String(ds.getData(n));
  }
  if (mode === 'push') {
    ds.pushData('new');
    return `${ds.totalCount()}|${String(ds.getData(n))}`;
  }
  if (mode === 'addFront') {
    ds.addData(0, 'head');
    return `${ds.totalCount()}|${ds.getData(0)}|${ds.getData(1)}`;
  }
  if (mode === 'addMid') {
    const mid = Math.floor(n / 2);
    ds.addData(mid, 'mid');
    return `${ds.totalCount()}|${ds.getData(mid)}`;
  }
  if (mode === 'addEnd') {
    ds.addData(n, 'tail');
    return `${ds.totalCount()}|${ds.getData(n)}`;
  }
  if (mode === 'set') {
    ds.setData(['x', 'y']);
    return `${ds.totalCount()}|${ds.getData(0)}|${ds.getData(1)}`;
  }
  return 'unknown';
}

/**
 * Constructs one of the eight Main model classes with the given string
 * payload and returns a pipe-joined snapshot of its readable fields.
 * Pure adapter: expectations in volume cases are frozen literals.
 */
export function runModel(kind: string, a: string, b: string, c: string, d: string): string {
  if (kind === 'Forecast') {
    const f = new Forecast(a, b, c, d, a, b);
    return `${f.degree}|${f.date}|${f.desc}|${f.win}|${f.winSpeed}`;
  }
  if (kind === 'WeekWeather') {
    const w = new WeekWeather(a, b, d, c, d, a, b);
    return `${w.date}|${w.week}|${w.weather}|${w.airLevel}|${w.max}|${w.min}`;
  }
  if (kind === 'AirIndex') {
    const x = new AirIndex(a, b);
    return `${x.index}|${String(x.figure)}`;
  }
  if (kind === 'SuitData') {
    const s = new SuitData($r('app.media.ic_weather_sunny'), a, b);
    return `${s.desc}|${s.value}`;
  }
  if (kind === 'AirData') {
    const g = new AirData(a, b);
    return `${g.airQuality}|${g.airDesc}`;
  }
  if (kind === 'HeaderData') {
    const h = new HeaderData(a, b, c, d, a, d, new AirData(b, c), a + b);
    return `${h.city}|${h.temp}|${h.weatherType}|${h.max}|${h.min}|${h.airData.airQuality}|${h.airTips}`;
  }
  if (kind === 'City') {
    const c2 = new City(a, b, c);
    return `${c2.name}|${c2.temp}|${c2.weather}`;
  }
  if (kind === 'CityListData') {
    const air = new AirData(a, b);
    const header = new HeaderData(a, b, c, d, a, c, air, d);
    const cl = new CityListData(a, header, [], [], air, [], []);
    return `${cl.city}|${cl.header.airData.airDesc}|${cl.hoursData.length}|${cl.weekData.length}|${cl.suitDate.length}`;
  }
  return 'unknown';
}

/**
 * Mock table snapshots: each adapter joins a fixed set of frozen fields with
 * '|' so that volume cases can compare against frozen literals without
 * touching union-typed mock properties directly from ArkTS strict mode.
 */
export function runMockTop(c: number): string {
  const w = weather[c];
  return `${w.cityid}|${w.city}|${w.cityEn}|${w.country}|${w.countryEn}|${w.update_time}`;
}

export function runMockAqi(c: number): string {
  const a = weather[c].aqi;
  return `${a.air}|${a.air_level}|${a.pm25}|${a.pm10}|${a.o3}|${a.no2}|${a.so2}|${a.co}|` +
    `${a.kouzhao}|${a.yundong}|${a.jinghuaqi}|${a.cityEn}|${a.update_time}`;
}

export function runMockDay(c: number, d: number): string {
  const x = weather[c].data[d];
  return `${x.day}|${x.date}|${x.week}|${x.wea}|${x.weaImg}|${x.tem}|${x.tem1}|${x.tem2}|` +
    `${x.air}|${x.air_level}|${x.sunrise}|${x.sunset}|${x.winSpeed}`;
}

export function runMockHour(c: number, k: number): string {
  const hours = weather[c].data[1].hours as Object as HourItem[];
  const h = hours[k];
  return `${h.hours}|${h.wea}|${h.weaImg}|${h.tem}|${h.win}|${h.winSpeed}`;
}

export function runMockIndex(c: number, k: number): string {
  const list = weather[c].data[1].index as Object as IndexItem[];
  const x = list[k];
  return `${x.title}|${x.level}|${x.desc}`;
}
