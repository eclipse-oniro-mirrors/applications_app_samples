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

import { FileInfo } from '../../../../main/ets/common/data/FileInfo';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';

/**
 * Builds a complete FileInfo object. Every field declared by fileAccess.FileInfo
 * is populated so that tests never rely on undefined values.
 */
export function createFileInfo(uri: string, fileName: string, size: number, mtime: number,
  mimeType: string, mode: number, relativePath: string, isRoot: boolean = false,
  deviceType: number = -1): FileInfo {
  const info: ESObject = {
    uri: uri,
    fileName: fileName,
    relativePath: relativePath,
    size: size,
    mtime: mtime,
    mimeType: mimeType,
    mode: mode,
    isRoot: isRoot,
    deviceType: deviceType
  };
  return info as FileInfo;
}

/**
 * Creates a FileBean backed by a FileInfo. Tests use this instead of the fake
 * constructor when they need deterministic names and paths.
 */
export function createBean(name: string, size: number = 1024, mode: number = 1,
  relativePath: string = '/storage/emulated/0/'): FileBean {
  const uri: string = 'file://' + relativePath + name;
  return new FileBean('id-' + name, createFileInfo(uri, name, size, 1700000000, '', mode, relativePath));
}

/** RootInfo shaped object used where fileAccess.RootInfo is expected. */
export function createRootInfo(uri: string, displayName: string, deviceType: number,
  relativePath: string = '/'): ESObject {
  const root: ESObject = {
    uri: uri,
    displayName: displayName,
    deviceType: deviceType,
    relativePath: relativePath,
    deviceFlags: 3,
    listFile: (): ESObject => ({}),
    scanFile: (): ESObject => ({})
  };
  return root;
}

export const VIDEO_NAMES: string[] = [
  'movie.mp4', 'clip.avi', 'sample.mkv', 'trailer.mov', 'stream.ts', 'video.webm',
  'film.m4v', 'show.mpg', 'drama.rmvb', 'anime.flv', 'MOVIE.MP4', 'CLIP.AVI',
  'sample.MKV', 'trailer.MOV', 'stream.TS', 'video.WEBM'
];

export const AUDIO_NAMES: string[] = [
  'song.mp3', 'track.aac', 'sound.flac', 'voice.m4a', 'record.wav', 'audio.ogg',
  'music.ape', 'podcast.wma', 'SONG.MP3', 'TRACK.AAC', 'sound.FLAC', 'voice.M4A'
];

export const IMAGE_NAMES: string[] = [
  'photo.jpg', 'picture.jpeg', 'icon.png', 'banner.webp', 'scan.bmp', 'anim.gif',
  'vector.svg', 'PHOTO.JPG', 'PICTURE.JPEG', 'icon.PNG', 'banner.WEBP'
];

export const DOC_NAMES: string[] = [
  'report.pdf', 'notes.txt', 'plan.doc', 'plan.docx', 'data.xls', 'data.xlsx',
  'slides.ppt', 'slides.pptx', 'REPORT.PDF', 'NOTES.TXT', 'data.XLS'
];

export const UNKNOWN_NAMES: string[] = [
  'archive.zip', 'binary.bin', 'package.hap', 'noextension', '', 'file.', 'weird.zzz',
  '.hidden', 'name.with.many.dots.mp4.bak'
];

export const INVALID_STRINGS: string[] = ['', ' ', '\n', '\t', 'undefined', 'null', '0', '-1'];

export const VALID_URIS: string[] = [
  'file:///data/storage/el2/base/files/a.txt',
  'file://media/Photo/1/IMG_001.jpg',
  'file://docs/storage/Users/currentUser/Documents/b.pdf',
  'file://usb/1A2B-3C4D/video/c.mp4'
];

export const SAMPLE_SIZES: number[] = [0, 1, 1023, 1024, 1025, 1048576, 1073741824, 1099511627776];

export function makeBeans(names: string[]): FileBean[] {
  const list: FileBean[] = [];
  for (let index = 0; index < names.length; index++) {
    list.push(createBean(names[index], index + 1));
  }
  return list;
}
