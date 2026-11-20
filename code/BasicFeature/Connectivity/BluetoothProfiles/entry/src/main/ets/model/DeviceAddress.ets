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
 * 蓝牙设备地址（deviceId）处理：格式校验、归一化与脱敏。
 * 接口参数错误会返回 401，因此调用前先本地校验格式，避免把明显非法的地址送进蓝牙服务。
 */

export const DEVICE_ID_SEGMENT_COUNT: number = 6;
export const EMPTY_DEVICE_ID_TEXT: string = '--';

const DEVICE_ID_PATTERN: string = '^[0-9A-Fa-f]{2}(:[0-9A-Fa-f]{2}){5}$';

export function normalizeDeviceId(raw: string): string {
  return raw.trim().toUpperCase();
}

export function isValidDeviceId(raw: string): boolean {
  const trimmed = raw.trim();
  if (trimmed.length === 0) {
    return false;
  }
  return new RegExp(DEVICE_ID_PATTERN).test(trimmed);
}

export function splitAddress(raw: string): string[] {
  const trimmed = raw.trim();
  if (trimmed.length === 0) {
    return [];
  }
  return trimmed.split(':');
}

/** 保留前两段与最后一段，中间三段用 * 代替，便于在界面上展示又不泄露完整地址 */
export function maskDeviceId(raw: string): string {
  const normalized = normalizeDeviceId(raw);
  if (!isValidDeviceId(normalized)) {
    return normalized.length > 0 ? normalized : EMPTY_DEVICE_ID_TEXT;
  }
  const segments = normalized.split(':');
  return `${segments[0]}:${segments[1]}:**:**:**:${segments[5]}`;
}

export function isSameDevice(left: string, right: string): boolean {
  return normalizeDeviceId(left) === normalizeDeviceId(right);
}
