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
 
import { LogUtil } from './LogUtil';

/** RGBA 颜色分量（0-255） */
export interface ColorRgba {
  r: number;
  g: number;
  b: number;
  a: number;
}

const TAG = 'ColorUtil';

export class ColorUtil {
  /** RGBA_8888 像素值打包：r/g/b/a 均为 0-255，返回无符号 32 位整数 */
  static rgba(r: number, g: number, b: number, a: number): number {
    return (((r & 0xFF) << 24) | ((g & 0xFF) << 16) | ((b & 0xFF) << 8) | (a & 0xFF)) >>> 0;
  }

  /** 解析 '#RRGGBB' 或 '#AARRGGBB'（缺省 alpha=255），非法输入返回 null 并告警 */
  static parseHex(hex: string): ColorRgba | null {
    const s: string = hex.trim();
    if (s.length !== 7 && s.length !== 9) {
      LogUtil.warn(TAG, `parseHex 非法长度：${hex}`);
      return null;
    }
    if (s.charAt(0) !== '#') {
      LogUtil.warn(TAG, `parseHex 缺少 # 前缀：${hex}`);
      return null;
    }
    const body: string = s.substring(1);
    let r = 0;
    let g = 0;
    let b = 0;
    let a = 255;
    if (body.length === 6) {
      r = parseInt(body.substring(0, 2), 16);
      g = parseInt(body.substring(2, 4), 16);
      b = parseInt(body.substring(4, 6), 16);
    } else {
      a = parseInt(body.substring(0, 2), 16);
      r = parseInt(body.substring(2, 4), 16);
      g = parseInt(body.substring(4, 6), 16);
      b = parseInt(body.substring(6, 8), 16);
    }
    if (Number.isNaN(r) || Number.isNaN(g) || Number.isNaN(b) || Number.isNaN(a)) {
      LogUtil.warn(TAG, `parseHex 含非法十六进制字符：${hex}`);
      return null;
    }
    return { r: r, g: g, b: b, a: a } as ColorRgba;
  }

  /** 生成 '#RRGGBB' 字符串（丢弃 alpha） */
  static toHex(r: number, g: number, b: number): string {
    const part = (v: number): string => {
      const s: string = (v & 0xFF).toString(16).toUpperCase();
      return s.length === 1 ? `0${s}` : s;
    };
    return `#${part(r)}${part(g)}${part(b)}`;
  }

  /** 生成 'rgba(r,g,b,a)' 字符串（alpha 归一化到 0-1），可直接用于 addColorStop */
  static toRgbaString(r: number, g: number, b: number, a: number): string {
    const alpha: number = Math.round((ColorUtil.clamp(a, 0, 255) / 255) * 100) / 100;
    return `rgba(${r & 0xFF},${g & 0xFF},${b & 0xFF},${alpha})`;
  }

  /** ColorRgba → 'rgba(...)' 字符串 */
  static toRgbaStringOf(c: ColorRgba): string {
    return ColorUtil.toRgbaString(c.r, c.g, c.b, c.a);
  }

  /** 两色线性插值：t=0 返回 c1，t=1 返回 c2，t 越界自动截断 */
  static lerp(c1: ColorRgba, c2: ColorRgba, t: number): ColorRgba {
    const k: number = ColorUtil.clamp(t, 0, 1);
    return {
      r: Math.round(c1.r + (c2.r - c1.r) * k),
      g: Math.round(c1.g + (c2.g - c1.g) * k),
      b: Math.round(c1.b + (c2.b - c1.b) * k),
      a: Math.round(c1.a + (c2.a - c1.a) * k)
    } as ColorRgba;
  }

  /** 多段色带插值：colors 均分为 (n-1) 段，t∈[0,1] 落在对应段内插值，返回 addColorStop 可用字符串 */
  static lerpHexStops(colors: string[], t: number): string {
    if (colors.length === 0) {
      return '#000000';
    }
    if (colors.length === 1) {
      const c: ColorRgba | null = ColorUtil.parseHex(colors[0]);
      return c === null ? '#000000' : ColorUtil.toRgbaStringOf(c);
    }
    const k: number = ColorUtil.clamp(t, 0, 1);
    const seg: number = k * (colors.length - 1);
    const i: number = Math.min(Math.floor(seg), colors.length - 2);
    const c1: ColorRgba | null = ColorUtil.parseHex(colors[i]);
    const c2: ColorRgba | null = ColorUtil.parseHex(colors[i + 1]);
    if (c1 === null || c2 === null) {
      return '#000000';
    }
    return ColorUtil.toRgbaStringOf(ColorUtil.lerp(c1, c2, seg - i));
  }

  /** 数值截断到 [min, max] */
  static clamp(v: number, min: number, max: number): number {
    if (v < min) {
      return min;
    }
    if (v > max) {
      return max;
    }
    return v;
  }
}

/**
 * GradientPreset 渐变预设库
 * 4 组按场景命名的色带（深→浅排列），配合 ColorUtil.lerpHexStops 做动画取色，
 * 或直接作为 createLinearGradient 的断点颜色。
 */
export class GradientPreset {
  static readonly SKY: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
  static readonly SUNSET: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
  static readonly OCEAN: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
  static readonly FOREST: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];

  private static readonly PRESETS: Map<string, string[]> = new Map([
    ['sky', GradientPreset.SKY],
    ['sunset', GradientPreset.SUNSET],
    ['ocean', GradientPreset.OCEAN],
    ['forest', GradientPreset.FOREST]
  ]);

  /** 全部预设名 */
  static getNames(): string[] {
    return Array.from(GradientPreset.PRESETS.keys());
  }

  /** 按名取预设色带，未命中返回 null */
  static get(name: string): string[] | null {
    return GradientPreset.PRESETS.get(name) ?? null;
  }

  /** 预设数量 */
  static count(): number {
    return GradientPreset.PRESETS.size;
  }
}
