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

export const createRecorder: () => bigint;

export const releaseRecorder: (objAddr: bigint) => void;

export const initNative: (objAddr: bigint, fd: number, videoCodecMime: string, width: number, height: number,
  frameRate: number, isHDRVivid: number, bitRate: number, isOpenEchoCancel: number, roiFd: number, roiPathType: number) => Promise<Response>

export const startNative: (objAddr: bigint, surfaceId: string) => void

export const setPlayerAsLiveBgm: (objRecorderAddr: bigint, objPlayerAddr: bigint) => void

export const updateInfoForCamera: (objAddr: bigint, isFront: boolean) => void

export const UpdateCameraRotation: (objAddr: bigint, rotation: number) => void

export const stopNative: (objAddr: bigint) => Promise<Response>

export const setIsOpenROI: (objAddr: bigint, isOpenROI: boolean) => void

export class Response {
  code: number
  surfaceId: string
}