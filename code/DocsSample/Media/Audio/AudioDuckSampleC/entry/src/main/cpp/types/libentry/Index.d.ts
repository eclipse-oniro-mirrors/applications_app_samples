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
export const musicRendererInit: () => void;
export const musicRendererStart: () => void;
export const musicRendererPause: () => void;
export const musicRendererStop: () => void;
export const musicRendererRelease: () => void;
export const navRendererInit: () => void;
export const navRendererInitWithDuckSession: () => void;
export const navRendererStart: () => void;
export const navRendererStop: () => void;
export const navRendererRelease: () => void;
export const finishNavigationWithDuckSession: () => void;
export const setMusicRendererParams: (samplingRate: number, channelCount: number, sampleFormat: number, lowLatencyMode: boolean) => void;
export const setNavRendererParams: (samplingRate: number, channelCount: number, sampleFormat: number, lowLatencyMode: boolean) => void;
export const onMusicInterrupt: (cbFn: (forceType: number, hintType: number) => void) => void;
export const onNavInterrupt: (cbFn: (forceType: number, hintType: number) => void) => void;
export const loadMusicInfo: (recordingFd: number, recordingFileSize: number, recordingDuration: number, recordingFileOffset: number) => void;
export const loadNavInfo: (recordingFd: number, recordingFileSize: number, recordingDuration: number, recordingFileOffset: number) => void;
export const getMusicProgress: () => number;
export const getNavProgress: () => number;
export const resetMusicFileOffset: () => void;
export const resetNavFileOffset: () => void;
export const enableMusicMixMode: () => void;
export const disableMusicMixMode: () => void;
