/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { SAMPLE_FILE_NAME } from '../common/AppConstants';

/**
 * 应用沙箱里可被 clearUpApplicationData 一并清理的五类目录。
 * 取值同时用作 UI/日志里的名字，便于定位是哪一类目录失败。
 */
export enum StorageArea {
  CACHE = 'cache',
  FILES = 'files',
  PREFERENCES = 'preferences',
  TEMP = 'temp',
  DATABASE = 'database'
}

export const STORAGE_AREAS: StorageArea[] = [
  StorageArea.CACHE,
  StorageArea.FILES,
  StorageArea.PREFERENCES,
  StorageArea.TEMP,
  StorageArea.DATABASE
];

export interface StoragePathRecord {
  area: StorageArea;
  dir: string;
  filePath: string;
  exists: boolean;
}

export interface StorageOperationResult {
  success: boolean;
  createdCount: number;
  totalCount: number;
  missing: StorageArea[];
}

/**
 * 取某类沙箱目录的绝对路径。
 */
export function resolveStorageDir(context: common.Context, area: StorageArea): string {
  switch (area) {
    case StorageArea.CACHE:
      return context.cacheDir;
    case StorageArea.FILES:
      return context.filesDir;
    case StorageArea.PREFERENCES:
      return context.preferencesDir;
    case StorageArea.TEMP:
      return context.tempDir;
    case StorageArea.DATABASE:
      return context.databaseDir;
    default:
      return context.filesDir;
  }
}

/**
 * 把目录和文件名拼成绝对路径。文件名允许带前导 `/`，也允许省略；
 * 文件名本身为空时直接返回目录，不产生以 `/` 结尾的路径。
 */
export function joinStoragePath(dir: string, fileName: string): string {
  let name: string = fileName;
  while (name.startsWith('/')) {
    name = name.substring(1);
  }
  return name.length === 0 ? dir : `${dir}/${name}`;
}

export function recordStoragePath(context: common.Context, area: StorageArea, fileName: string): StoragePathRecord {
  const dir: string = resolveStorageDir(context, area);
  const filePath: string = joinStoragePath(dir, fileName);
  return {
    area: area,
    dir: dir,
    filePath: filePath,
    exists: fileIo.accessSync(filePath)
  };
}

export function listStoragePaths(context: common.Context, fileName: string = SAMPLE_FILE_NAME): StoragePathRecord[] {
  const records: StoragePathRecord[] = [];
  STORAGE_AREAS.forEach((area: StorageArea) => {
    records.push(recordStoragePath(context, area, fileName));
  });
  return records;
}

/**
 * 创建单个占位文件；已存在时按覆盖写方式打开，保证重复点击不会报错。
 */
export function createStorageFile(filePath: string): boolean {
  let file: fileIo.File | undefined = undefined;
  try {
    file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
    return fileIo.accessSync(filePath);
  } catch (error) {
    return false;
  } finally {
    if (file !== undefined) {
      fileIo.closeSync(file);
    }
  }
}

export function createStorageFiles(context: common.Context, fileName: string = SAMPLE_FILE_NAME):
  StorageOperationResult {
  const records: StoragePathRecord[] = listStoragePaths(context, fileName);
  let createdCount: number = 0;
  records.forEach((record: StoragePathRecord) => {
    if (createStorageFile(record.filePath)) {
      createdCount += 1;
    }
  });
  const missing: StorageArea[] = countMissing(context, fileName);
  return {
    success: missing.length === 0,
    createdCount: createdCount,
    totalCount: records.length,
    missing: missing
  };
}

export function countExisting(context: common.Context, fileName: string = SAMPLE_FILE_NAME): number {
  let count: number = 0;
  listStoragePaths(context, fileName).forEach((record: StoragePathRecord) => {
    if (record.exists) {
      count += 1;
    }
  });
  return count;
}

export function countMissing(context: common.Context, fileName: string = SAMPLE_FILE_NAME): StorageArea[] {
  const missing: StorageArea[] = [];
  listStoragePaths(context, fileName).forEach((record: StoragePathRecord) => {
    if (!record.exists) {
      missing.push(record.area);
    }
  });
  return missing;
}

export function removeStorageFiles(context: common.Context, fileName: string = SAMPLE_FILE_NAME): number {
  let removed: number = 0;
  listStoragePaths(context, fileName).forEach((record: StoragePathRecord) => {
    if (!record.exists) {
      return;
    }
    try {
      fileIo.unlinkSync(record.filePath);
      removed += 1;
    } catch (error) {
      // 单个目录删除失败不影响其余目录，计数会体现在返回值里
    }
  });
  return removed;
}
