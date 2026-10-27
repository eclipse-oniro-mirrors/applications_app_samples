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
 * Returns whether an index can address a detail entry in a list of the given count.
 */
export function isDetailIndexValid(index: number, count: number): boolean {
  return index >= 0 && index < count;
}

/**
 * Resolves a feature detail route to a valid detail index. Explicit valid routes
 * are preserved; missing, negative or out-of-range routes collapse to the first
 * detail (index 0).
 */
export function resolveFeatureDetailIndex(route: number | undefined, count: number): number {
  if (count <= 0) {
    return 0;
  }
  if (route !== undefined && route >= 0 && route < count) {
    return route;
  }
  return 0;
}

/**
 * Resolves a smart-life detail index giving an explicit valid route priority,
 * then falling back to the persisted focus, then to the first scene.
 */
export function resolveSmartLifeDetailIndex(route: number | undefined, stored: number, count: number): number {
  if (count <= 0) {
    return 0;
  }
  if (route !== undefined && route >= 0 && route < count) {
    return route;
  }
  if (stored >= 0 && stored < count) {
    return stored;
  }
  return 0;
}

/**
 * Returns whether an index has a previous detail entry (index greater than zero).
 */
export function hasPreviousDetail(index: number): boolean {
  return index > 0;
}

/**
 * Returns whether an index has a next detail entry within a list of the given count.
 */
export function hasNextDetail(index: number, count: number): boolean {
  return index >= 0 && index < count - 1;
}
