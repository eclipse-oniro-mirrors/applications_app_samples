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

export const createRecorder: () => number;
export const setRecorderStateCallback: (callback: (state: number, reason: number) => void) => number;
export const setRecorderErrorCallback: (callback: (errorCode: number, errorMsg: string) => void) => number;
export const setRecorderUriCallback: () => void;
export const prepareAudioRecorder: () => number;
export const prepareVideoRecorder: () => number;
export const getInputSurfaceId: () => string;
export const startRecorder: () => number;
export const pauseRecorder: () => number;
export const resumeRecorder: () => number;
export const stopRecorder: () => number;
export const resetRecorder: () => number;
export const releaseRecorder: () => number;
