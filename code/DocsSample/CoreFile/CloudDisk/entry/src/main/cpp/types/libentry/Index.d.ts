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

export interface SyncFolder {
  path: string;
  state: number;
  displayNameResId: number;
  displayName: string;
}

export interface ChangesResult {
  nextUsn: number;
  isEof: boolean;
  changesData: ChangeData[];
}

export interface ChangeData {
  updateSequenceNumber: number;
  fileId: string;
  parentFileId: string;
  relativePath: string;
  operationType: number;
  size: number;
  mtime: number;
  timeStamp: number;
}

export interface FileSyncState {
  path: string;
  state: number;
}

export interface ResultList {
  path: string;
  isSuccess: boolean;
  syncState?: number;
  errorReason?: number;
}

export interface IsPlaceholderResult {
  code: number;
  isPlaceholder: boolean;
}

export interface CustomInfoResult {
  code: number;
  dataLength: number;
  data: string;
}

export interface FileItem {
  name: string;
  path: string;
  parentPath: string;
  isDirectory: boolean;
  mtime: number;
  size: number;
  syncState: number;
}

// 同步根管理
export const registerSyncFolder: (path: string, displayName: string) => number;
export const unRegisterSyncFolder: (path: string) => number;
export const unRegisterAllSyncFolder: () => void;
export const activeSyncFolder: (path: string) => number;
export const deactiveSyncFolder: (path: string) => number;
export const getAllSyncFolder: () => SyncFolder[];
export const updateDisplayName: (path: string, alias: string) => number;
export const registerSyncFolderChange: (path: string) => number;
export const unRegisterSyncFolderChange: (path: string) => number;
export const getSyncFolderChanges: (path: string, usn: number, count: number) => ChangesResult;
export const setFileSyncStates: (path: string, length: number, states: FileSyncState[]) => number;
export const getFileSyncStates: (path: string, length: number, paths: string[]) => ResultList[];
export const registerCallback: (cb: (msg: string) => void) => void;

// 占位符与水合 (CAPI)
export const createPlaceholderFile: (syncPath: string, relativePath: string, atimeMs: number, mtimeMs: number, logicalSize: number) => number;
export const isPlaceholderFile: (syncPath: string, relativePath: string) => IsPlaceholderResult;
export const updatePlaceholder: (syncPath: string, relativePath: string, atimeMs: number, mtimeMs: number, logicalSize: number) => number;
export const convertPlaceholderToFile: (syncPath: string, relativePath: string) => number;
export const markFileAsPlaceholder: (syncPath: string, relativePath: string) => number;
export const unmarkPlaceholderFile: (syncPath: string, relativePath: string) => number;
export const getPlaceholderCustomInfo: (syncPath: string, relativePath: string) => CustomInfoResult;
export const dehydrateFile: (syncPath: string, relativePath: string) => number;
export const hydratePlaceholder: (syncPath: string, relativePath: string, callbackType: number) => number;
export const registerCallbackTable: (syncPath: string, fetchFileName?: string) => number;
export const unregisterCallbackTable: (syncPath: string) => number;
export const execute: (
    callbackType: number, reqKey: number, syncPath: string, filePath: string,
    fileContent: string, offset: number, size: number, isComplete: boolean, totalSize: number
) => number;
export const getCallbackReqKey: () => number;
export const getCallbackReqKeyVersion: () => number;
